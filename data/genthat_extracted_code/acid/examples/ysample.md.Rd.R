library(acid)


### Name: ysample.md
### Title: Sampling Incomes from a Mixture of Income Distributions
### Aliases: ysample.md

### ** Examples

data(dist.para.t)
ygrid<-seq(0,1e5,by=1000)
theta<-c(5,1,10,3)
p0<-0.2
p1<-0.3
p2<-0.5
n <-10
ysample.md(n, "LOGNO", "LOGNO", theta, p0, p1, p2, dist.para.t)




