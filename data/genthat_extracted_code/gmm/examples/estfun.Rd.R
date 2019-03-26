library(gmm)


### Name: estfun
### Title: Extracts the empirical moment function
### Aliases: estfun.gmmFct estfun.gmm estfun.gel estfun.tsls
###   model.matrix.tsls

### ** Examples


n = 500
phi<-c(.2,.7)
thet <- 0
sd <- .2
x <- matrix(arima.sim(n=n,list(order=c(2,0,1),ar=phi,ma=thet,sd=sd)),ncol=1)
y <- x[7:n]
ym1 <- x[6:(n-1)]
ym2 <- x[5:(n-2)]
H <- cbind(x[4:(n-3)], x[3:(n-4)], x[2:(n-5)], x[1:(n-6)])
g <- y ~ ym1 + ym2
x <- H
res <- gmm(g, x,weightsMatrix = diag(5))

gt <- res$gt
G <- res$G

foc <- gt
foc2 <- estfun(res)

foc[1:5,]
foc2[1:5,]




