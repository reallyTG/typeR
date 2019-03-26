library(splm)


### Name: vcov.splm
### Title: Covariance extractor method for 'splm' objects
### Aliases: vcov.splm
### Keywords: vcov

### ** Examples

## not run:
## data(Produc, package="plm")
## data(usaww)
## fm <- log(gsp)~log(pcap)+log(pc)+log(emp)+unemp
## sarremod <- spml(fm, data=Produc, listw = mat2listw(usaww),
##  model="random", lag=TRUE, spatial.error="none")
## ## compact representation of betas
## library(lmtest)
## coeftest(sarremod)
## ## linear hypothesis test
## library(car)
## lht(sarremod, "log(pcap)=log(pc)")



