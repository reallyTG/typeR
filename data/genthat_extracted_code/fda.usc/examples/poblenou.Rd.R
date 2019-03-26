library(fda.usc)


### Name: poblenou
### Title: poblenou data
### Aliases: poblenou
### Keywords: datasets

### ** Examples

data(poblenou)
names(poblenou)
names(poblenou$nox) 
nox<-poblenou$nox
class(nox)
ind.weekend<-as.integer(poblenou$df[,"day.week"])>5
plot(nox,col=ind.weekend+1)



