library(DiscreteWeibull)


### Name: Discrete Weibull (Type 3)
### Title: The type 3 discrete Weibull distribution
### Aliases: ddweibull3 pdweibull3 qdweibull3 rdweibull3 hdweibull3
### Keywords: distribution

### ** Examples

# ddweibull3
x <- 0:10
c <- 0.3
beta <- 0.75
p <- ddweibull3(x, c, beta)
p
plot(x, p, type="b", ylab=expression(P(X)==x))
# pdweibull3
x <- 0:10
c <- 0.5
beta <- 0.5
p <- pdweibull3(x, c, beta)
p
cumsum(ddweibull3(x, c, beta))
plot(x, p, type="s", ylab=expression(P(X<=x)))
# qdweibull3
p <- c(1:9)/10
p
c <- 0.1
beta <- 0.5
qdweibull3(p, c, beta)
pdweibull3(10, c, beta)
pdweibull3(9, c, beta)
# rdweibull3
n <- 20
c <- 0.25
beta <- -0.25
x <- rdweibull3(n, c, beta)
x
beta <- 0
x <- rdweibull3(n, c, beta)
x
beta <- 0.25
x <- rdweibull3(n, c, beta)
x
n <- 1000
x <- rdweibull3(n, c, beta)
obs <- c(sum(x==0), tabulate(x))
obs <- obs/sum(obs)
theo <- ddweibull3(min(x):max(x), c, beta)
barplot(rbind(obs, theo), beside=TRUE, names.arg=min(x):max(x),
ylab="relative frequency/probability", col=1:2)
legend(24, 0.1, c("observed", "theoretical"), pch=15, col=1:2)
#hdweibull3
x <- 0:15
c <- 0.5
hn<-hdweibull3(x, c, beta = -0.5)
h0<-hdweibull3(x, c, beta = 0)
hp<-hdweibull3(x, c, beta = 0.5)
plot(x, hn, type="b", ylim = c(0, 1), ylab="hazard rate")
points(x, h0, type = "b", col=2)
points(x, hp, type = "b", col=3)
legend(11, 0.5, c("beta<0", "beta=0", "beta>0"), col=1:3, pch=21)



