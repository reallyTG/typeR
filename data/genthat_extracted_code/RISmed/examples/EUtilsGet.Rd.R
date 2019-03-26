library(RISmed)


### Name: EUtilsGet
### Title: Results of an NCBI EUtils query
### Aliases: EUtilsGet

### ** Examples


# PUBMED QUERY FOR MYELOMA ARTICLES FOR LAST YEAR
res <- EUtilsSummary("myeloma[ti]",retmax=2,reldate=365)

summary(res)

fetch <- EUtilsGet(res)

# PUBMED RETURNS A MEDLINE OBJECT
fetch

PMID(fetch)

Author(fetch)[[1]]




