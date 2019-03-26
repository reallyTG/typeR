library(psych)


### Name: Schmid
### Title: 12 variables created by Schmid and Leiman to show the
###   Schmid-Leiman Transformation
### Aliases: Schmid schmid.leiman West Chen
### Keywords: datasets

### ** Examples

data(Schmid)
cor.plot(Schmid,TRUE)
print(fa(Schmid,6,rotate="oblimin"),cut=0)  #shows an oblique solution
round(cov2cor(schmid.leiman),2)
cor.plot(cov2cor(West),TRUE)



