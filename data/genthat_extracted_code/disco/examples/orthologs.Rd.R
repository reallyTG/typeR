library(disco)


### Name: orthologs
### Title: Example ortholog data set
### Aliases: orthologs

### ** Examples

data(orthologs)
# view the object as a data frame
head(as(orthologs, "data.frame"))
# calculate the disco score
ds <- disco.score(orthologs)



