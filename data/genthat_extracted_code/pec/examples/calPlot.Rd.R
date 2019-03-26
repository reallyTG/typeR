library(pec)


### Name: calPlot
### Title: Calibration plots for right censored data
### Aliases: calPlot
### Keywords: survival

### ** Examples


library(prodlim)
library(lava)
library(riskRegression)
library(survival)
# survival
dlearn <- SimSurv(40)
dval <- SimSurv(100)
f <- coxph(Surv(time,status)~X1+X2,data=dlearn,x=TRUE,y=TRUE)
cf=calPlot(f,time=3,data=dval)
print(cf)
plot(cf)

g <- coxph(Surv(time,status)~X2,data=dlearn,x=TRUE,y=TRUE)
cf2=calPlot(list("Cox regression X1+X2"=f,"Cox regression X2"=g),
    time=3,
    type="risk",
    data=dval)
print(cf2)
plot(cf2)
calPlot(f,time=3,data=dval,type="survival")
calPlot(f,time=3,data=dval,bars=TRUE,pseudo=FALSE)
calPlot(f,time=3,data=dval,bars=TRUE,type="risk",pseudo=FALSE)

## show a red line which follows the hanging bars
calPlot(f,time=3,data=dval,bars=TRUE,hanging=TRUE)
a <- calPlot(f,time=3,data=dval,bars=TRUE,hanging=TRUE,abline.col=NULL)
lines(c(0,1,ceiling(a$xcoord)),
      c(a$offset[1],a$offset,a$offset[length(a$offset)]),
      col=2,lwd=5,type="s")

calPlot(f,time=3,data=dval,bars=TRUE,type="risk",hanging=TRUE)

set.seed(13)
m <- crModel()
regression(m, from = "X1", to = "eventtime1") <- 1
regression(m, from = "X2", to = "eventtime1") <- 1
m <- addvar(m,c("X3","X4","X5"))
distribution(m, "X1") <- binomial.lvm()
distribution(m, "X4") <- binomial.lvm()
d1 <- sim(m,100)
d2 <- sim(m,100)
csc <- CSC(Hist(time,event)~X1+X2+X3+X4+X5,data=d1)
fgr <- FGR(Hist(time,event)~X1+X2+X3+X4+X5,data=d1,cause=1)
predict.crr <- cmprsk:::predict.crr
cf3=calPlot(list("Cause-specific Cox"=csc,"Fine-Gray"=fgr),
        time=5,
        legend.x=-0.3,
        legend.y=1.35,
        ylab="Observed event status",
        legend.legend=c("Cause-specific Cox regression","Fine-Gray regression"),
        legend.xpd=NA)
print(cf3)
plot(cf3)

b1 <- calPlot(list("Fine-Gray"=fgr),time=5,bars=TRUE,hanging=FALSE)
print(b1)
plot(b1)

calPlot(fgr,time=5,bars=TRUE,hanging=TRUE)





