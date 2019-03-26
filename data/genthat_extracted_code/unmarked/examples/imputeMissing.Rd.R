library(unmarked)


### Name: imputeMissing
### Title: A function to impute missing entries in continuous obsCovs
### Aliases: imputeMissing
### Keywords: utilities

### ** Examples


data(frogs)
pcru.obscovs <- data.frame(MinAfterSunset=as.vector(t(pcru.data[,,1])),
     Wind=as.vector(t(pcru.data[,,2])),
     Sky=as.vector(t(pcru.data[,,3])),
     Temperature=as.vector(t(pcru.data[,,4])))
pcruUMF <- unmarkedFrameOccu(y = pcru.bin, obsCovs = pcru.obscovs)
pcruUMF.i1 <- imputeMissing(pcruUMF)
pcruUMF.i2 <- imputeMissing(pcruUMF, whichCovs = 2)




