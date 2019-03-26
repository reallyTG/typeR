library(LSMonteCarlo)


### Name: AmerPutLSM
### Title: Calculating the price of plain vanilla American put
### Aliases: AmerPutLSM print.AmerPut summary.AmerPut
### Keywords: Monte Carlo Option pricing American put

### ** Examples

AmerPutLSM()
put<-AmerPutLSM(Spot=14.2, Strike=16.5, n=500, m=100)
put
summary(put)
price(put)
put$price



