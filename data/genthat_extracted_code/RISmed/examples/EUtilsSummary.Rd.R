library(RISmed)


### Name: EUtilsSummary
### Title: Get summary of NCBI EUtils query
### Aliases: EUtilsSummary

### ** Examples


# PUBMED QUERY
res <- EUtilsSummary("myeloma[ti] jones[au]", retmax = 10)

res

summary(res)
QueryCount(res)
QueryId(res)
QueryTranslation(res)

# PROTEIN QUERY
res <- EUtilsSummary("C-reactive[ti]",db="protein", retmax = 10)
summary(res)




