library(npmv)


### Name: npmv-package
### Title: Nonparametric Comparison of Multivariate Samples
### Aliases: npmv-package npmv
### Keywords: package

### ** Examples

data(sberry)
nonpartest(weight|bot|fungi|rating~treatment,sberry,permreps=1000)
ssnonpartest(weight|bot|fungi|rating~treatment,sberry,test=c(1,0,0,0),alpha=.05,
            factors.and.variables=TRUE)



