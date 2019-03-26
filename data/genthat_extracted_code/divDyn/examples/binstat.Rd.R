library(divDyn)


### Name: binstat
### Title: Sampling statistics and diversity indices in every bin
### Aliases: binstat

### ** Examples

data(corals)
# slice-specific sampling
basic <- binstat(corals, tax="genus", bin="stg")

# subsampling diagnostic
 subStats <- subsample(corals, method="cr", tax="genus", FUN=binstat, 
   bin="stg", q=100,noNAStart=FALSE)

# maximum quota with x
more <- binstat(corals, tax="genus", bin="stg", coll="collection_no", x=1.4)




