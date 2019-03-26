library(quickregression)


### Name: qlm
### Title: Quick Linear Regression
### Aliases: qlm
### Keywords: qlm

### ** Examples

  a<-mtcars[,c(1,3,4,5,6,7)]
  b<-qlm(a,mpg)
  summary(b)
  b<-qlm(a,mpg,signifi =0.20)
  summary(b)
  b<-qlm(a,mpg,signifi =0.20,vifl=20)
  summary(b)



