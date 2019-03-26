library(boottol)


### Name: vastol
### Title: Bootstrap Alternative to Vasicek Test.
### Aliases: vastol

### ** Examples

data("vasdata")
vas.level=vastol(segment=vasdata$segment,target=vasdata$response
,bootsamp=500,grp=10,alpha=0.99,lower=1)



