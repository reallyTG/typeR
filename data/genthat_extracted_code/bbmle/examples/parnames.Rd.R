library(bbmle)


### Name: parnames
### Title: get and set parameter names
### Aliases: parnames parnames<-
### Keywords: misc

### ** Examples

x <- 1:5
set.seed(1001)
y <- rbinom(5,prob=x/(1+x),size=10)
mfun <- function(p) {
  a <- p[1]
  b <- p[2]
  -sum(dbinom(y,prob=a*x/(b+x),size=10,log=TRUE))
}
optim(fn=mfun,par=c(1,1))
parnames(mfun) <- c("a","b")
mle2(minuslogl=mfun,start=c(a=1,b=1),method="Nelder-Mead")



