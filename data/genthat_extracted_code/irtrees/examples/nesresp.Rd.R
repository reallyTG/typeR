library(irtrees)


### Name: nesresp
### Title: Example Data: Nested Hierarchical Latent Variables
### Aliases: nesresp
### Keywords: datasets

### ** Examples

str(nesresp)
head(nesresp)
str(nesrespT <-
    dendrify(nesresp, cbind(c(0,0,1,1), c(0,1,NA,NA), c(NA,NA,0,1))))
head(nesrespT, 20)



