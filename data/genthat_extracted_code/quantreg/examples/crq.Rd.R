library(quantreg)


### Name: crq
### Title: Functions to fit censored quantile regression models
### Aliases: crq crq.fit.por crq.fit.por2 crq.fit.pow crq.fit.pen print.crq
###   print.crq coef.crq predict.crq predict.crqs Curv
### Keywords: survival regression

### ** Examples

# An artificial Powell example
set.seed(2345)
x <- sqrt(rnorm(100)^2)
y <-  -0.5 + x +(.25 + .25*x)*rnorm(100)
plot(x,y, type="n")
s <- (y > 0)
points(x[s],y[s],cex=.9,pch=16)
points(x[!s],y[!s],cex=.9,pch=1)
yLatent <- y
y <- pmax(0,y)
yc <- rep(0,100)
for(tau in (1:4)/5){
        f <- crq(Curv(y,yc) ~ x, tau = tau, method = "Pow")
        xs <- sort(x)
        lines(xs,pmax(0,cbind(1,xs)%*%f$coef),col="red")
        abline(rq(y ~ x, tau = tau), col="blue")
        abline(rq(yLatent ~ x, tau = tau), col="green")
        }
legend(.15,2.5,c("Naive QR","Censored QR","Omniscient QR"),
        lty=rep(1,3),col=c("blue","red","green"))

# crq example with left censoring
set.seed(1968)
n <- 200
x <-rnorm(n)
y <- 5 + x + rnorm(n)
plot(x,y,cex = .5)
c <- 4 + x + rnorm(n)
d <- (y > c)
points(x[!d],y[!d],cex = .5, col = 2)
f <- crq(survival::Surv(pmax(y,c), d, type = "left") ~ x, method = "Portnoy")
g <- summary(f)
for(i in 1:4) abline(coef(g[[i]])[,1])



