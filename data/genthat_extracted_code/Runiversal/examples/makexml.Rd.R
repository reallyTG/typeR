library(Runiversal)


### Name: makexml
### Title: makexml
### Aliases: makexml
### Keywords: call R from other languages

### ** Examples

x<-1:10
y<-rnorm(10)
ols<-summary(lm(y~x))
cat(makexml(ols))



