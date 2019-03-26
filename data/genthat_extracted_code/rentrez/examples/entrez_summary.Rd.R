library(rentrez)


### Name: entrez_summary
### Title: Get summaries of objects in NCBI datasets from a unique ID
### Aliases: entrez_summary

### ** Examples

## No test: 
 pop_ids = c("307082412", "307075396", "307075338", "307075274")
 pop_summ <- entrez_summary(db="popset", id=pop_ids)
 extract_from_esummary(pop_summ, "title")
 
 # clinvar example
 res <- entrez_search(db = "clinvar", term = "BRCA1", retmax=10)
 cv <- entrez_summary(db="clinvar", id=res$ids)
 cv
 extract_from_esummary(cv, "title", simplify=FALSE)
 extract_from_esummary(cv, "trait_set")[1:2] 
 extract_from_esummary(cv, "gene_sort") 
## End(No test)



