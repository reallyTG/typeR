library(gss)


### Name: ssden
### Title: Estimating Probability Density Using Smoothing Splines
### Aliases: ssden ssden1
### Keywords: smooth models distribution

### ** Examples

## 1-D estimate: Buffalo snowfall
data(buffalo)
buff.fit <- ssden(~buffalo,domain=data.frame(buffalo=c(0,150)))
plot(xx<-seq(0,150,len=101),dssden(buff.fit,xx),type="l")
plot(xx,pssden(buff.fit,xx),type="l")
plot(qq<-seq(0,1,len=51),qssden(buff.fit,qq),type="l")
## Clean up
## Not run: 
##D rm(buffalo,buff.fit,xx,qq)
##D dev.off()
## End(Not run)

## 2-D with triangular domain: AIDS incubation
data(aids)
## rectangular quadrature
quad.pt <- expand.grid(incu=((1:40)-.5)/40*100,infe=((1:40)-.5)/40*100)
quad.pt <- quad.pt[quad.pt$incu<=quad.pt$infe,]
quad.wt <- rep(1,nrow(quad.pt))
quad.wt[quad.pt$incu==quad.pt$infe] <- .5
quad.wt <- quad.wt/sum(quad.wt)*5e3
## additive model (pre-truncation independence)
aids.fit <- ssden(~incu+infe,data=aids,subset=age>=60,
                  domain=data.frame(incu=c(0,100),infe=c(0,100)),
                  quad=list(pt=quad.pt,wt=quad.wt))
## conditional (marginal) density of infe
jk <- cdssden(aids.fit,xx<-seq(0,100,len=51),data.frame(incu=50))
plot(xx,jk$pdf,type="l")
## conditional (marginal) quantiles of infe (TIME-CONSUMING)
## Not run: 
##D cqssden(aids.fit,c(.05,.25,.5,.75,.95),data.frame(incu=50))
## End(Not run)
## Clean up
## Not run: 
##D rm(aids,quad.pt,quad.wt,aids.fit,jk,xx)
##D dev.off()
## End(Not run)

## One factor plus one vector
data(gastric)
gastric$trt
fit <- ssden(~futime*trt,data=gastric)
## conditional density
cdssden(fit,c("1","2"),cond=data.frame(futime=150))
## conditional quantiles
cqssden(fit,c(.05,.25,.5,.75,.95),data.frame(trt="1"))
## Clean up
## Not run: rm(gastric,fit)

## Sampling bias
## (X,T) is truncated to T<X<1 for T~U(0,1), so X is length-biased
rbias <- function(n) {
  t <- runif(n)
  x <- rnorm(n,.5,.15)
  ok <- (x>t)&(x<1)
  while(m<-sum(!ok)) {
    t[!ok] <- runif(m)
    x[!ok] <- rnorm(m,.5,.15)
    ok <- (x>t)&(x<1)
  }
  cbind(x,t)
}
xt <- rbias(100)
x <- xt[,1]; t <- xt[,2]
## length-biased
bias1 <- list(t=1,wt=1,fun=function(t,x){x[,]})
fit1 <- ssden(~x,domain=list(x=c(0,1)),bias=bias1)
plot(xx<-seq(0,1,len=101),dssden(fit1,xx),type="l")
## truncated
bias2 <- list(t=t,wt=rep(1/100,100),fun=function(t,x){x[,]>t})
fit2 <- ssden(~x,domain=list(x=c(0,1)),bias=bias2)
plot(xx,dssden(fit2,xx),type="l")
## Clean up
## Not run: rm(rbias,xt,x,t,bias1,fit1,bias2,fit2)



