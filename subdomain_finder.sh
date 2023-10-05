echo "" && echo -n "Enter domain: " && read domain

gau --subs $domain | unfurl domains >> vul1.txt

echo "" && echo "Scan with gau completed"

waybackurls $domain | unfurl domains >> vul2.txt

echo "Scan with waybackurls completed"

subfinder -d $domain -silent >> vul3.txt

echo "Scan with subfinder completed"

echo "" && echo "All tests completed , Removing Duplicates"

cat vul1.txt vul2.txt vul3.txt | sort -u >> unique_subs.txt

rm -rf vul1.txt vul2.txt vul3.txt

echo "Saved to unique_subs.txt"

echo "" && echo "Testing for domains running http server"

cat unique_subs.txt | httpx -silent > unique_sub_http.txt

echo "Saved to unique_sub_http.txt"
