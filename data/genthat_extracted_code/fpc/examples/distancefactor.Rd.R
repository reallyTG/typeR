library(fpc)


### Name: distancefactor
### Title: Factor for dissimilarity of mixed type data
### Aliases: distancefactor
### Keywords: cluster

### ** Examples

  set.seed(776655)
  d1 <- sample(1:5,20,replace=TRUE)
  d2 <- sample(1:4,20,replace=TRUE)
  ldata <- cbind(d1,d2)
  lc <- cat2bin(ldata,categorical=1)$data
  lc[,1:5] <- lc[,1:5]*distancefactor(5,20,type="categorical")
  lc[,6] <- lc[,6]*distancefactor(4,20,type="ordinal")



