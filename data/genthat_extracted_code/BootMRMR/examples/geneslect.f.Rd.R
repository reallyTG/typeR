library(BootMRMR)


### Name: geneslect.f
### Title: Informative gene set selection using F-score
### Aliases: geneslect.f
### Keywords: gene gene subset F-score

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
s=20
geneslect.f (x, y, s)



