library(fastcox)


### Name: fastcox-package
### Title: Lasso and elastic-net penalized Cox's regression in high
###   dimensions models using the cocktail algorithm
### Aliases: fastcox-package
### Keywords: package

### ** Examples

data(FHT)
m1<-cocktail(x=FHT$x,y=FHT$y,d=FHT$status,alpha=0.5)
predict(m1,type="nonzero")
plot(m1)



