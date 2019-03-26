library(mets)


### Name: biprobit
### Title: Bivariate Probit model
### Aliases: biprobit biprobit.vector biprobit.time

### ** Examples

data(prt)
prt0 <- subset(prt,country=="Denmark")
a <- biprobit(cancer~1+zyg, ~1+zyg, data=prt0, id="id")
b <- biprobit(cancer~1+zyg, ~1+zyg, data=prt0, id="id",pairs.only=TRUE)
predict(b,newdata=lava::Expand(prt,zyg=c("MZ")))
predict(b,newdata=lava::Expand(prt,zyg=c("MZ","DZ")))

## No test: 
 ## Reduce Ex.Timings
library(lava)
m <- lvm(c(y1,y2)~x)
covariance(m,y1~y2) <- "r"
constrain(m,r~x+a+b) <- function(x) tanh(x[2]+x[3]*x[1])
distribution(m,~x) <- uniform.lvm(a=-1,b=1)
ordinal(m) <- ~y1+y2
d <- sim(m,1000,p=c(a=0,b=-1)); d <- d[order(d$x),]
dd <- fast.reshape(d)

a <- biprobit(y~1+x,rho=~1+x,data=dd,id="id")
summary(a, mean.contrast=c(1,.5), cor.contrast=c(1,.5))
with(predict(a,data.frame(x=seq(-1,1,by=.1))), plot(p00~x,type="l"))

pp <- predict(a,data.frame(x=seq(-1,1,by=.1)),which=c(1))
plot(pp[,1]~pp$x, type="l", xlab="x", ylab="Concordance", lwd=2, xaxs="i")
confband(pp$x,pp[,2],pp[,3],polygon=TRUE,lty=0,col=Col(1))

pp <- predict(a,data.frame(x=seq(-1,1,by=.1)),which=c(9)) ## rho
plot(pp[,1]~pp$x, type="l", xlab="x", ylab="Correlation", lwd=2, xaxs="i")
confband(pp$x,pp[,2],pp[,3],polygon=TRUE,lty=0,col=Col(1))
with(pp, lines(x,tanh(-x),lwd=2,lty=2))

xp <- seq(-1,1,length.out=6); delta <- mean(diff(xp))
a2 <- biprobit(y~1+x,rho=~1+I(cut(x,breaks=xp)),data=dd,id="id")
pp2 <- predict(a2,data.frame(x=xp[-1]-delta/2),which=c(9)) ## rho
confband(pp2$x,pp2[,2],pp2[,3],center=pp2[,1])


## End(No test)

## Time
## Not run: 
##D     a <- biprobit.time(cancer~1, rho=~1+zyg, id="id", data=prt, eqmarg=TRUE,
##D                        cens.formula=Surv(time,status==0)~1,
##D                        breaks=seq(75,100,by=3),fix.censweights=TRUE)
##D 
##D     a <- biprobit.time2(cancer~1+zyg, rho=~1+zyg, id="id", data=prt0, eqmarg=TRUE,
##D                        cens.formula=Surv(time,status==0)~zyg,
##D                        breaks=100)
##D 
##D     a1 <- biprobit.time2(cancer~1, rho=~1, id="id", data=subset(prt0,zyg=="MZ"), eqmarg=TRUE,
##D                        cens.formula=Surv(time,status==0)~1,
##D                        breaks=100,pairs.only=TRUE)
##D 
##D     a2 <- biprobit.time2(cancer~1, rho=~1, id="id", data=subset(prt0,zyg=="DZ"), eqmarg=TRUE,
##D                         cens.formula=Surv(time,status==0)~1,
##D                         breaks=100,pairs.only=TRUE)
##D 
##D     prt0$trunc <- prt0$time*runif(nrow(prt0))*rbinom(nrow(prt0),1,0.5)
##D     a3 <- biprobit.time(cancer~1, rho=~1, id="id", data=subset(prt0,zyg=="DZ"), eqmarg=TRUE,
##D                         cens.formula=Surv(trunc,time,status==0)~1,
##D                         breaks=100,pairs.only=TRUE)
##D 
##D     plot(a,which=3,ylim=c(0,0.1))
## End(Not run) 



