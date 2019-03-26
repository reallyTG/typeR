library(fda.usc)


### Name: dcor.xy
### Title: Distance Correlation Statistic and t-Test
### Aliases: dcor.test dcor.dist bcdcor.dist dcor.xy
### Keywords: htest multivariate nonparametric

### ** Examples

x<-rproc2fdata(100,1:50)
y<-rproc2fdata(100,1:50)
dcor.xy(x, y,test=TRUE)
dx <- metric.lp(x)
dy <- metric.lp(y)
dcor.test(dx, dy)
bcdcor.dist(dx, dy)
dcor.xy(x, y,test=FALSE)
dcor.dist(dx, dy)



