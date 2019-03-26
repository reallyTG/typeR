## ---- echo=FALSE, message=FALSE------------------------------------------
library(utils)
library(stats)
library(LambertW)
library(survival)
library(km.ci)
library(optband)

## ---- echo=TRUE----------------------------------------------------------
set.seed(1990)
N = 200
x1 <- stats::rweibull(N, 1, 1)
x2 <- stats::rweibull(N, 2, 1)
d <- x1 < x2
x <- pmin(x1,x2)
mydata = data.frame(stop = x, event = d)
S = survival::survfit(Surv(x, d) ~ 1, type="kaplan-meier")

## ---- fig.show='hold', fig.height=6, fig.width=6, echo=TRUE--------------
opt_S <- optband::opt.ci(S, conf.level = 0.95, fun = "surv", tl = NA, tu = NA)
plot(opt_S, xlab="time", ylab="KM", mark.time=FALSE)

## ---- fig.show='hold', fig.height=6, fig.width=6, echo=TRUE--------------
opt_H <- optband::opt.ci(S, conf.level = 0.95, fun = "cumhaz", tl = NA, tu = NA)
plot(opt_H, fun="cumhaz", xlab="time", ylab="CH", mark.time=FALSE)

## ---- fig.show='hold', fig.height=6, fig.width=6, echo=TRUE--------------
opt_H <- optband::opt.ci(S, conf.level = 0.90, fun = "cumhaz", tl = .1, tu = .9)
plot(opt_H, fun="cumhaz", xlab="time", ylab="CH", mark.time=FALSE)

## ---- fig.height=6, fig.width=6, echo=TRUE-------------------------------
color <- c("grey", "darkblue", "red", "green")
plot(S, mark.time=FALSE, xlab="time", ylab="KM", col = "white")

lines(opt_S, col=color[2], lty=2, lwd=2, mark.time=F)
e <- km.ci::km.ci(S, conf.level = 0.95, method = "epband")
h <- km.ci::km.ci(S, conf.level = 0.95, method = "hall-wellner")
lines(e, col=color[3], lty=3, lwd=2, mark.time=F)
lines(h, col=color[4], lty=4, lwd=2, mark.time=F)
lines(S,col="grey", lwd=2, mark.time=F)

legend("topright", c("KM", "optband", "epband", "hall-wellner"), 
       lwd=2, lty=1:4, col=color)

## ---- fig.height=6, fig.width=6, echo=TRUE-------------------------------
dat <- bladder[bladder$enum==1,]
Hdif = survival::survfit(Surv(stop, event) ~ rx, type="kaplan-meier", data=dat)
opt_Hdif <- optband::opt.ci(Hdif, fun="cumhaz", conf.level = 0.95, samples=2)

plot(opt_Hdif$difference~opt_Hdif$time, xlab="t", ylim=c(-1.5,1),
     main=expression(hat(Lambda)(t)[1]-hat(Lambda)(t)[2]), ylab="", col = "white")
lines(opt_Hdif$difference~opt_Hdif$time, col = "grey", lty=1, lwd=2)
lines(-log(opt_Hdif$upper)~opt_Hdif$time, col=4, lty=3, lwd=2)
lines(-log(opt_Hdif$lower)~opt_Hdif$time, col=4, lty=3, lwd=2)

