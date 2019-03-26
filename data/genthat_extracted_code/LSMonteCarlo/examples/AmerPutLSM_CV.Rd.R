library(LSMonteCarlo)


### Name: AmerPutLSM_CV
### Title: Pricing plain vanilla American put with Control Variates
### Aliases: AmerPutLSM_CV print.AmerPutCV summary.AmerPutCV
### Keywords: Monte Carlo Option pricing American put

### ** Examples

AmerPutLSM_CV()
put<-AmerPutLSM_CV(Spot=14.2, Strike=16.5, n=200, m=50)
put
summary(put)
price(put)
put$price



