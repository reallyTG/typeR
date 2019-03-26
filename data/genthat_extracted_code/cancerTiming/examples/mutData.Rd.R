library(cancerTiming)


### Name: mutData
### Title: Example Mutation Data
### Aliases: mutData
### Keywords: datasets

### ** Examples

data(mutData)
head(mutData)
#only mutations in the CNLOH region
onlyMuts<-subset(mutData,is.na(rsID) & position <= 1.8E7) 



