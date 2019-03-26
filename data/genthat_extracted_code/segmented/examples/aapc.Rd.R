library(segmented)


### Name: aapc
### Title: Average annual per cent change in segmented trend analysis
### Aliases: aapc
### Keywords: regression

### ** Examples

x<-1:20
y<-2-.5*x+.7*pmax(x-9,0)-.8*pmax(x-15,0)+rnorm(20)*.3
o<-lm(y~x)
os<-segmented(o, psi=c(5,10))
aapc(os)



