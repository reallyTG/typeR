library(FitAR)


### Name: ARToPacf
### Title: Reparametrize AR Coefficients In Terms of PACF
### Aliases: ARToPacf
### Keywords: ts

### ** Examples

somePACF<-c(0.5,0.6,0.7,0.8,-0.9,-0.8)
#PacfToAR() transforms PACF to AR parameter coefficients. 
someAR<-PacfToAR(somePACF)
test<-ARToPacf(someAR)
#This should be very small
sum(abs(test-somePACF))



