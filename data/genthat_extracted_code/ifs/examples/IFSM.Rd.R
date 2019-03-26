library(ifs)


### Name: IFSM
### Title: IFSM operator
### Aliases: IFSM
### Keywords: misc

### ** Examples

require(ifs)

set.seed(123)
n <- 50
dt <- 1/n
t <- (1:n)*dt
Z <- rnorm(n)
B <- sqrt(dt)*cumsum(Z)

ifsm.w.maps() -> maps
a <- maps$a
s <- maps$s

ifsm.setQF(B, s, a) -> QF
ifsm.cf(QF$Q,QF$b,QF$L1,QF$L2,s)-> SOL
psi <- SOL$psi

t1 <- seq(0,1,length=250)
as.numeric(sapply(t1, function(x) IFSM(x,psi,a,s,k=5))) -> B.ifsm
old.mar <- par()$mar
old.mfrow <- par()$mfrow
par(mfrow=c(2,1))
par(mar=c(4,4,1,1))
plot(t1,B.ifsm,type="l",xlab="time",ylab="IFSM")
plot(t,B,col="red",type="l",xlab="time",ylab="Euler scheme")
par(mar=old.mar)
par(mfrow=old.mfrow)



