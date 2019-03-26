library(rentrez)


### Name: parse_pubmed_xml
### Title: Summarize an XML record from pubmed.
### Aliases: parse_pubmed_xml

### ** Examples


hox_paper <- entrez_search(db="pubmed", term="10.1038/nature08789[doi]")
hox_rel <- entrez_link(db="pubmed", dbfrom="pubmed", id=hox_paper$ids)
recs <- entrez_fetch(db="pubmed", 
                       id=hox_rel$links$pubmed_pubmed[1:3], 
                       rettype="xml")
parse_pubmed_xml(recs)




