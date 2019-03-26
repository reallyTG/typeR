library(multiDimBio)


### Name: PercentMax
### Title: A function to scale data to the percent of the maximum observed
### Aliases: PercentMax

### ** Examples

data(Nuclei)

colMeans(Nuclei, na.rm=TRUE)

Nuclei.PM<-PercentMax(Nuclei)

colMeans(Nuclei.PM, na.rm=TRUE)



