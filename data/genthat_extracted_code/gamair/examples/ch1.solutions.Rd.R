library(gamair)


### Name: ch1.solutions
### Title: Solution code for Chapter 1: Linear Models
### Aliases: ch1.solutions

### ** Examples

library(gamair); library(mgcv)

## Q.8 Rubber
## a)
library(MASS)
m1 <- lm(loss~hard+tens+I(hard*tens)+I(hard^2)+I(tens^2)+
I(hard^2*tens)+I(tens^2*hard)+I(tens^3)+I(hard^3),Rubber)
plot(m1)    ## residuals OK
summary(m1) ## p-values => drop I(tens^2*hard)
m2 <- update(m1,.~.-I(tens^2*hard))
summary(m2)
m3 <- update(m2,.~.-hard)
summary(m3)
m4 <- update(m3,.~.-1)
summary(m4)
m5 <- update(m4,.~.-I(hard^2))
summary(m5) ## p-values => keep all remaining
plot(m5)    ## residuals OK

## b)
AIC(m1,m2,m3,m4,m5)
m6 <- step(m1)

## c)
m <- 40;attach(Rubber)
mt <- seq(min(tens),max(tens),length=m)
mh <- seq(min(hard),max(hard),length=m)
lp <- predict(m6,data.frame(hard=rep(mh,rep(m,m)),
                            tens=rep(mt,m)))
contour(mt,mh,matrix(lp,m,m),xlab="tens",ylab="hard")
points(tens,hard)
detach(Rubber)

## Q.9 warpbreaks
wm <- lm(breaks~wool*tension,warpbreaks)
par(mfrow=c(2,2))
plot(wm)    # residuals OK
anova(wm)
## ... so there is evidence for a wool:tension interaction.
par(mfrow=c(1,1))
with(warpbreaks,interaction.plot(tension,wool,breaks))

## Q.10 cars
## a)
cm1 <- lm(dist ~ speed + I(speed^2),cars)
summary(cm1)
## Intercept has very high p-value, so drop it
cm2 <- lm(dist ~ speed + I(speed^2)-1,cars)
summary(cm2)
## both terms now significant, but try the alternative of
## dropping `speed'
cm3 <- lm(dist ~ I(speed^2),cars)
AIC(cm1,cm2,cm3)
plot(cm2)
# Clearly cm2, with speed and speed squared terms, is to be preferred,
# but note that variance seems to be increasing with mean a little:
# perhaps a GLM, better?

## b)
# In seconds, the answer is obtained as follows..
b <- coef(cm2)
5280/(b[1]*60^2)
# This is a long time, but would have a rather wide associated confidence
# interval.

## Q.11 QR
# The following is a version of the function that you should end up with.

fitlm <- function(y,X)
{ qrx <- qr(X)                ## get QR decomposition
  y <- qr.qty(qrx,y)          ## form Q'y efficiently
  R <- qr.R(qrx)              ## extract R
  p <- ncol(R);n <- length(y) ## get dimensions
  f <- y[1:p]; r <- y[(p+1):n]## partition Q'y
  beta <- backsolve(R,f)      ## parameter estimates (a)
  sig2 <- sum(r^2)/(n-p)      ## resid variance estimate (c)
  Ri <- backsolve(R,diag(ncol(R))) ## inverse of R matrix
  Vb <- Ri%*%t(Ri)*sig2       ## covariance matrix
  se <- diag(Vb)^.5           ## standard errors (c)
  F.ratio <- f^2/sig2         ## sequential F-ratios
  seq.p.val <- 1-pf(F.ratio,1,n-p) ## seq. p-values (e)
  list(beta=beta,se=se,sig2=sig2,seq.p.val=seq.p.val,df=n-p)
} ## fitlm

# The following code uses the function to answer some of the question parts.

## get example X ...
X <- model.matrix(dist ~ speed + I(speed^2),cars)
cm <- fitlm(cars$dist,X) # used fitting function
cm$beta;cm$se            # print estimates and s.e.s (a,c)
cm1<-lm(dist ~ speed + I(speed^2),cars) # equiv. lm call
summary(cm1)             # check estimates and s.e.s (b,c)
t.ratio <- cm$beta/cm$se # form t-ratios
p.val <- pt(-abs(t.ratio),df=cm$df)*2
p.val                    # print evaluated p-values (d)
## print sequential ANOVA p-values, and check them (e)
cm$seq.p.val
anova(cm1)

## Q.12 InsectSprays
X <- model.matrix(~spray-1,InsectSprays)
X <- cbind(rep(1,nrow(X)),X)   # redundant model matrix
C <- matrix(c(0,rep(1,6)),1,7) # constraints
qrc <- qr(t(C))                # QR decomp. of C'
## use fact that Q=[D:Z] and XQ = (Q'X')' to form XZ ...
XZ <- t(qr.qty(qrc,t(X)))[,2:7]
m1 <- lm(InsectSprays$count~XZ-1) # fit model
bz <- coef(m1) # estimates in constrained parameterization
## form b = Z b_z, using fact that Q=[D:Z], again
b <- c(0,bz)
b <- qr.qy(qrc,b)
sum(b[2:7])

## Q.13 trees
## a)
EV.func <- function(b,g,h)
{ mu <- b[1]*g^b[2]*h^b[3]
  J <- cbind(g^b[2]*h^b[3],mu*log(g),mu*log(h))
  list(mu=mu,J=J)
}

## b)
attach(trees)
b <- c(.002,2,1);b.old <- 100*b+100
while (sum(abs(b-b.old))>1e-7*sum(abs(b.old))) {
   EV <- EV.func(b,Girth,Height)
   z <- (Volume-EV$mu) + EV$J%*%b
   b.old <- b
   b <- coef(lm(z~EV$J-1))
}
b

## c)
sig2 <- sum((Volume - EV$mu)^2)/(nrow(trees)-3)
Vb <- solve(t(EV$J)%*%EV$J)*sig2
se <- diag(Vb)^.5;se




