library(LSMonteCarlo)


### Name: QuantoAmerPutLSM
### Title: Calculating the price of Quanto American put
### Aliases: QuantoAmerPutLSM print.QuantoAmerPut summary.QuantoAmerPut
### Keywords: Monte Carlo Option pricing American put

### ** Examples

QuantoAmerPutLSM(n=200, m=50)
put<-QuantoAmerPutLSM(Spot=14.2, Strike=16.5, n=200, m=50)
put
summary(put)
price(put)



