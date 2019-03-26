library(rentrez)


### Name: entrez_link
### Title: Get links to datasets related to records from an NCBI database
### Aliases: entrez_link

### ** Examples

## No test: 
 pubmed_search <- entrez_search(db = "pubmed", term ="10.1016/j.ympev.2010.07.013[doi]")
 linked_dbs <- entrez_db_links("pubmed")
 linked_dbs
 nucleotide_data <- entrez_link(dbfrom = "pubmed", id = pubmed_search$ids, db ="nuccore")
 #Sources for the full text of the paper 
 res <- entrez_link(dbfrom="pubmed", db="", cmd="llinks", id=pubmed_search$ids)
 linkout_urls(res)
## End(No test)




