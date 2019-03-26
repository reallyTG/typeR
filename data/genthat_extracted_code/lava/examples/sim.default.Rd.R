library(lava)


### Name: sim.default
### Title: Wrapper function for mclapply
### Aliases: sim.default as.sim

### ** Examples

m <- lvm(y~x+e)
distribution(m,~y) <- 0
distribution(m,~x) <- uniform.lvm(a=-1.1,b=1.1)
transform(m,e~x) <- function(x) (1*x^4)*rnorm(length(x),sd=1)

onerun <- function(iter=NULL,...,n=2e3,b0=1,idx=2) {
    d <- sim(m,n,p=c("y~x"=b0))
    l <- lm(y~x,d)
    res <- c(coef(summary(l))[idx,1:2],
             confint(l)[idx,],
             estimate(l,only.coef=TRUE)[idx,2:4])
    names(res) <- c("Estimate","Model.se","Model.lo","Model.hi",
                    "Sandwich.se","Sandwich.lo","Sandwich.hi")
    res
}
val <- sim(onerun,R=10,b0=1,messages=0,mc.cores=1)
val

val <- sim(val,R=40,b0=1,mc.cores=1) ## append results
summary(val,estimate=c(1,1),confint=c(3,4,6,7),true=c(1,1))

summary(val,estimate=c(1,1),se=c(2,5),names=c("Model","Sandwich"))
summary(val,estimate=c(1,1),se=c(2,5),true=c(1,1),names=c("Model","Sandwich"),confint=TRUE)

if (interactive()) {
    plot(val,estimate=1,c(2,5),true=1,names=c("Model","Sandwich"),polygon=FALSE)
    plot(val,estimate=c(1,1),se=c(2,5),main=NULL,
         true=c(1,1),names=c("Model","Sandwich"),
         line.lwd=1,col=c("gray20","gray60"),
         rug=FALSE)
    plot(val,estimate=c(1,1),se=c(2,5),true=c(1,1),
         names=c("Model","Sandwich"))
}

f <- function(a=1,b=1) {
  rep(a*b,5)
}
R <- Expand(a=1:3,b=1:3)
sim(f,R,type=0)
sim(function(a,b) f(a,b), 3, args=c(a=5,b=5),type=0)
sim(function(iter=1,a=5,b=5) iter*f(a,b), type=0, iter=TRUE, R=5)



