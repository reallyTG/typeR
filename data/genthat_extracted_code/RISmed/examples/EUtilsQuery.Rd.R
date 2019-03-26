library(RISmed)


### Name: EUtilsQuery
### Title: Construct URL to make NCBI EUtils query
### Aliases: EUtilsQuery EUtilsQuery-class

### ** Examples


# PUBMED QUERY
EUtilsQuery("myeloma[ti] jones[au]")

# RESTRICT TO RECORDS WITHIN LAST 30 days
EUtilsQuery("myeloma[ti] jones[au]",reldat=30)





