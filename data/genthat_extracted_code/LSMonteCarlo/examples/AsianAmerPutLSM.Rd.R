library(LSMonteCarlo)


### Name: AsianAmerPutLSM
### Title: Calculating the price of Asian American put
### Aliases: AsianAmerPutLSM print.AsianAmerPut summary.AsianAmerPut
### Keywords: Monte Carlo Option pricing American put

### ** Examples

AsianAmerPutLSM(n=500, m=100)
put<-AsianAmerPutLSM(Spot=14.2, Strike=16.5, n=500, m=50)
put
summary(put)
price(put)
put$price



