library(insect)


### Name: searchGB
### Title: Query the NCBI GenBank database.
### Aliases: searchGB

### ** Examples

  ## Query the GenBank database for Eukaryote mitochondrial 16S DNA sequences
  ## between 100 and 300 base pairs in length that were modified between
  ## the years 1999 and 2000.
  ## No test: 
    query <- "Eukaryota[ORGN]+AND+16S[TITL]+AND+100:300[SLEN]+AND+1999:2000[MDAT]"
    x <- searchGB(query, prompt = FALSE)
  
## End(No test)



