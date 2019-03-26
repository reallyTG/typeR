library(agricolae)


### Name: Median.test
### Title: Median test. Multiple comparisons
### Aliases: Median.test
### Keywords: nonparametric

### ** Examples

library(agricolae)
# example 1
data(corn)
out<-with(corn,Median.test(observation,method,console=FALSE))
z<-bar.err(out$medians,variation = "range",ylim=c(0,120),
           space=2,border=4,col=3,density=10,angle=45)
# example 2
out<-with(corn,Median.test(observation,method,console=FALSE,group=FALSE))
print(out$comparison)



