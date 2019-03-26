library(rmeta)


### Name: cummeta
### Title: Cumulative meta-analysis of binary data
### Aliases: cummeta cummeta.summaries print.meta.cum plot.meta.cum
###   print.summary.meta.cum summary.meta.cum
### Keywords: htest hplot

### ** Examples

data(cochrane)
steroid<-cummeta(n.trt,n.ctrl,ev.trt,ev.ctrl,names=name,data=cochrane,
  statistic="RR",method="meta.MH")
plot(steroid)
summary(steroid)
data(catheter)
b <- meta.DSL(n.trt, n.ctrl, col.trt, col.ctrl, data=catheter,
              names=Name, subset=c(13,6,5,3,12,4,11,1,8,10,2))
d <- cummeta.summaries(b$logs, b$selogs, names=b$names,
                    method="random", logscale=TRUE)
plot(d,summary.conf=TRUE)
summary(d)



