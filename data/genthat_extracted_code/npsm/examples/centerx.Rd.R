library(npsm)


### Name: centerx
### Title: Center Matrix
### Aliases: centerx

### ** Examples

x <- cbind(seq(1,5,length=5),seq(10,20,length=5))
xc <- centerx(x)
apply(xc,1,mean)



