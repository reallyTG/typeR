library(refund)


### Name: ffpc
### Title: Construct a PC-based function-on-function regression term
### Aliases: ffpc

### ** Examples

## Not run: 
##D set.seed(1122)
##D n <- 55
##D S <- 60
##D T <- 50
##D s <- seq(0,1, l=S)
##D t <- seq(0,1, l=T)
##D 
##D #generate X from a polynomial FPC-basis:
##D rankX <- 5
##D Phi <- cbind(1/sqrt(S), poly(s, degree=rankX-1))
##D lambda <- rankX:1
##D Xi <- sapply(lambda, function(l)
##D             scale(rnorm(n, sd=sqrt(l)), scale=FALSE))
##D X <- Xi %*% t(Phi)
##D 
##D beta.st <- outer(s, t, function(s, t) cos(2 * pi * s * t))
##D 
##D y <- (1/S*X) %*% beta.st + 0.1 * matrix(rnorm(n * T), nrow=n, ncol=T)
##D 
##D data <- list(y=y, X=X)
##D # set number of FPCs to true rank of process for this example:
##D m.pc <- pffr(y ~ c(1) + 0 + ffpc(X, yind=t, decomppars=list(npc=rankX)),
##D         data=data, yind=t)
##D summary(m.pc)
##D m.ff <- pffr(y ~ c(1) + 0 + ff(X, yind=t), data=data, yind=t)
##D summary(m.ff)
##D 
##D # fits are very similar:
##D all.equal(fitted(m.pc), fitted(m.ff))
##D 
##D # plot implied coefficient surfaces:
##D layout(t(1:3))
##D persp(t, s, t(beta.st), theta=50, phi=40, main="Truth",
##D     ticktype="detailed")
##D plot(m.ff, select=1, pers=TRUE, zlim=range(beta.st), theta=50, phi=40,
##D     ticktype="detailed")
##D title(main="ff()")
##D ffpcplot(m.pc, type="surf", auto.layout=FALSE, theta = 50, phi = 40)
##D title(main="ffpc()")
##D 
##D # show default ffpcplot:
##D ffpcplot(m.pc)
## End(Not run)



