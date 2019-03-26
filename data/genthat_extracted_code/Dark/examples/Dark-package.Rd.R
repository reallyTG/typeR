library(Dark)


### Name: Dark-package
### Title: Dark: A package to analyse dark adaptation data
### Aliases: Dark-package Dark
### Keywords: package

### ** Examples

set.seed(1234)
Time<- seq(0,20)
tmp<- TestData(Time)
P<-Start(tmp,1000)
MSC<-ModelSelect(tmp, P)
tmp2<-BestFit(tmp, MSC)
tmp3<-MultiStart(tmp2,10)
BootDark(tmp3,50) 



