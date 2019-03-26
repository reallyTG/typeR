library(rmeta)


### Name: meta.summaries
### Title: Meta-analysis based on effect estimates
### Aliases: meta.summaries print.meta.summaries plot.meta.summaries
###   summary.meta.summaries print.summary.meta.summaries
### Keywords: htest hplot

### ** Examples

data(catheter)
b <- meta.DSL(n.trt, n.ctrl, col.trt, col.ctrl, data=catheter,
              names=Name, subset=c(13,6,5,3,12,4,11,1,8,10,2))
d <- meta.summaries(b$logs, b$selogs, names=b$names,
                    method="random", logscale=TRUE)



