library(biogeo)


### Name: outliers
### Title: Detects outliers using values extracted from an environmental
###   variable
### Aliases: outliers

### ** Examples

rid<-1:20
species<-rep("Species A",20)
dups=rep(0,20)
ev<-c(rnorm(19,mean=20,sd=1),40)
a<-outliers(rid, species, dups, ev)


