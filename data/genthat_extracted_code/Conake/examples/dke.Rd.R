library(Conake)


### Name: dke
### Title: Function for probability density estimation
### Aliases: dke

### ** Examples

## A sample data with n=100.
V<-rgamma(100,1.5,2.6)


##The bandwidth can be the one obtained by cross validation.
h<-0.052
## We choose Gamma kernel.

est<-dke(V,"GA",h)
est$f_n







