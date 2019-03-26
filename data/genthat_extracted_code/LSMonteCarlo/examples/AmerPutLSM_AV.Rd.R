library(LSMonteCarlo)


### Name: AmerPutLSM_AV
### Title: Pricing plain vanilla American put with Antithetic Variates
### Aliases: AmerPutLSM_AV print.AmerPutAV summary.AmerPutAV
### Keywords: Monte Carlo Option pricing American put

### ** Examples

AmerPutLSM_AV(n=500, m=50)
put<-AmerPutLSM_AV(Spot=14.2, Strike=16.5, n=200, m=50)
put
summary(put)
price(put)
put$price



