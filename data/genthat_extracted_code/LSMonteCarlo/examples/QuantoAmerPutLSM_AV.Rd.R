library(LSMonteCarlo)


### Name: QuantoAmerPutLSM_AV
### Title: Pricing Quanto American put with Antithetic Variates
### Aliases: QuantoAmerPutLSM_AV print.QuantoAmerPut_AV
###   summary.QuantoAmerPut_AV
### Keywords: Monte Carlo Option pricing American put

### ** Examples

QuantoAmerPutLSM_AV(n=200, m=50)
put<-QuantoAmerPutLSM_AV(Spot=14.2, Strike=16.5, n=200, m=50)
put
summary(put)
price(put)



