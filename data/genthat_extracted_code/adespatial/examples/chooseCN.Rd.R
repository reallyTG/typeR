library(adespatial)


### Name: chooseCN
### Title: Function to choose a connection network
### Aliases: chooseCN
### Keywords: spatial utilities

### ** Examples


if(require("ade4", quietly = TRUE)){
data(mafragh)

par(mfrow=c(2,2))
cn1 <- chooseCN(mafragh$xy,ask=FALSE,type=1)
cn2 <- chooseCN(mafragh$xy,ask=FALSE,type=2)
cn3 <- chooseCN(mafragh$xy,ask=FALSE,type=3)
cn4 <- chooseCN(mafragh$xy,ask=FALSE,type=4)

}




