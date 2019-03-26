library(acid)


### Name: pval.md
### Title: P-Value for a Mixture of Income Distributions
### Aliases: pval.md

### ** Examples

data(dist.para.t)
ygrid<-seq(0,1e5,by=1000)
theta<-c(5,1,10,3)
p0<-0.2
p1<-0.3
p2<-0.5
n <-10000
y.sim <- ysample.md(n, "LOGNO", "LOGNO", theta, p0, p1, p2, dist.para.t)
pval<-pval.md(ygrid,"LOGNO", "LOGNO", theta, 
              p0, p1, p2, dist.para.table=dist.para.t)
mean(y.sim<=ygrid[10])
pval[10]



