library(multiDimBio)


### Name: MeanCent
### Title: A function to scale data to mean 0
### Aliases: MeanCent

### ** Examples

data(Nuclei)

colMeans(Nuclei, na.rm=TRUE)

Nuclei.MC<-MeanCent(Nuclei)

colMeans(Nuclei.MC, na.rm=TRUE)



