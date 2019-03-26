library(mosaic)


### Name: factorize
### Title: Conditionally convert vectors to factors
### Aliases: factorize factorize.default factorize.numeric
###   factorize.character factorize.data.frame factorise

### ** Examples

data(KidsFeet, package="mosaicData")
str(KidsFeet)
factorize(KidsFeet$birthyear)
str(factorize(KidsFeet))
# alternative spelling
str(factorise(KidsFeet))



