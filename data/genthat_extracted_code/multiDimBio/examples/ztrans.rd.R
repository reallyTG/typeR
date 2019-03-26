library(multiDimBio)


### Name: ZTrans
### Title: A function to convert data into a z-score
### Aliases: ZTrans

### ** Examples

data(Nuclei)

colMeans(Nuclei, na.rm=TRUE)

Nuclei.ZT<-ZTrans(Nuclei)

colMeans(Nuclei.ZT, na.rm=TRUE)



