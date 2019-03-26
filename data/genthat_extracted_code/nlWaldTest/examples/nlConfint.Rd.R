library(nlWaldTest)


### Name: nlConfint
### Title: Confidence intervals for nonlinear functions of parameters
### Aliases: nlConfint

### ** Examples

set.seed(13)
x1<-rnorm(30);x2<-rnorm(30);x3<-rnorm(30);y<-rnorm(30)
set.seed(NULL)
lm1a<-lm(y~x1+x2+x3)
nlConfint(lm1a, c("b[2]^3+b[3]*b[1]","b[2]"))



