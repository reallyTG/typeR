library(hierfstat)


### Name: exhier
### Title: Example data set with 4 levels, one diploid and one haploid
###   locus
### Aliases: exhier
### Keywords: datasets

### ** Examples

data(exhier)
varcomp(exhier[,1:5])
varcomp(exhier[,c(1:4,6)],diploid=FALSE)




