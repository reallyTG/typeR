library(FitAR)


### Name: PacfToAR
### Title: Transform from PACF Parameters to AR Coefficients
### Aliases: PacfToAR
### Keywords: ts

### ** Examples

somePACF<-c(0.5,0.6,0.7,0.8,-0.9,-0.8)
someAR<-PacfToAR(somePACF)
test<-ARToPacf(someAR)
#this should be very small
sum(abs(test-somePACF))



