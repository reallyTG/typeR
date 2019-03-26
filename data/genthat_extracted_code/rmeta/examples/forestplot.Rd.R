library(rmeta)


### Name: forestplot
### Title: Forest plots
### Aliases: forestplot
### Keywords: hplot

### ** Examples

data(cochrane)
steroid <- meta.MH(n.trt, n.ctrl, ev.trt, ev.ctrl,
                        names=name, data=cochrane)

tabletext<-cbind(c("","Study",steroid$names,NA,"Summary"),
          c("Deaths","(steroid)",cochrane$ev.trt,NA,NA),
          c("Deaths","(placebo)", cochrane$ev.ctrl, NA,NA),
          c("","OR",format(exp(steroid$logOR),digits=2),NA,format(exp(steroid$logMH),digits=2))
          )

m<- c(NA,NA,steroid$logOR,NA,steroid$logMH)
l<- m-c(NA,NA,steroid$selogOR,NA,steroid$selogMH)*2
u<- m+c(NA,NA,steroid$selogOR,NA,steroid$selogMH)*2
forestplot(tabletext,m,l,u,zero=0,
   is.summary=c(TRUE,TRUE,rep(FALSE,8),TRUE),
   clip=c(log(0.1),log(2.5)), xlog=TRUE,
   col=meta.colors(box="royalblue",
       line="darkblue", summary="royalblue"))

forestplot(tabletext,m,l,u,zero=0,
    is.summary=c(TRUE,TRUE,rep(FALSE,8),TRUE),
   clip=c(log(0.1),log(2.5)), xlog=TRUE, boxsize=0.75,
   col=meta.colors(box="royalblue",line="darkblue",
    summary="royalblue"))




