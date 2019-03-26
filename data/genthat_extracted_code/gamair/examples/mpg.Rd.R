library(gamair)


### Name: mpg
### Title: Data on automobile efficiency on town streets and highway.
### Aliases: mpg
### Keywords: data

### ** Examples

require(gamair);require(mgcv)
data(mpg)
b <- gam(list(city.mpg~fuel+style+drive+s(weight)+s(hp)+s(make,bs="re"),
          hw.mpg~fuel+style+drive++s(weight)+s(hp)+s(make,bs="re")),
          family=mvn(d=2),data=mpg)
plot(b,pages=1,scheme=1)



