library(npmv)


### Name: ssnonpartest
### Title: Nonparametric Comparison of Multivariate Samples Using Subset
###   algorithm
### Aliases: ssnonpartest
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(sberry)
ssnonpartest(weight|bot|fungi|rating~treatment,sberry,test=c(1,0,0,0),alpha=.05,
            factors.and.variables=TRUE)



