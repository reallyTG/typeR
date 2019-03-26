library(gamair)


### Name: ch3.solutions
### Title: Solution code for Chapter 3: Generalized Linear Models
### Aliases: ch3.solutions

### ** Examples

library(gamair); library(mgcv)

## Q.2 Residuals

n <- 100; m <- 10
x <- runif(n)
lp <- 3*x-1
mu <- binomial()$linkinv(lp)
y <- rbinom(1:n,m,mu)
par(mfrow=c(2,2))
plot(glm(y/m ~ x,family=binomial,weights=rep(m,n)))

## example glm fit...
b <- glm(y/m ~ x,family=binomial,weights=rep(m,n))
reps <- 200;mu <- fitted(b)
rsd <- matrix(0,reps,n) # array for simulated resids
runs <- rep(0,reps)  # array for simulated run counts
for (i in 1:reps) {  # simulation loop
  ys <- rbinom(1:n,m,mu) # simulate from fitted model
  ## refit model to simulated data
  br <- glm(ys/m ~ x,family=binomial,weights=rep(m,n))
  rs <- residuals(br) # simulated resids (meet assumptions)
  rsd[i,] <- sort(rs) # store sorted residuals
  fv.sort <- sort(fitted(br),index.return=TRUE)
  rs <- rs[fv.sort$ix] # order resids by sorted fit values
  rs <- rs > 0         # check runs of +ve, -ve resids
  runs[i] <- sum(rs[1:(n-1)]!=rs[2:n])
}
# plot original ordered residuals, and simulation envelope
for (i in 1:n) rsd[,i] <- sort(rsd[,i])
par(mfrow=c(1,1))
plot(sort(residuals(b)),(1:n-.5)/n) # original
## plot 95% envelope ....
lines(rsd[5,],(1:n-.5)/n);lines(rsd[reps-5,],(1:n-.5)/n)

# compare original runs to distribution under independence
rs <- residuals(b)
fv.sort <- sort(fitted(b),index.return=TRUE)
rs <- rs[fv.sort$ix]
rs <- rs > 0
obs.runs <- sum(rs[1:(n-1)]!=rs[2:n])
sum(runs>obs.runs)

## Q.3 Death penalty

## read in data...
count <- c(53,414,11,37,0,16,4,139)
death <- factor(c(1,0,1,0,1,0,1,0))
defendant <- factor(c(0,0,1,1,0,0,1,1))
victim <- factor(c(0,0,0,0,1,1,1,1))
levels(death) <- c("no","yes")
levels(defendant) <- c("white","black")
levels(victim) <- c("white","black")

## a)
sum(count[death=="yes"&defendant=="black"])/
    sum(count[defendant=="black"])
sum(count[death=="yes"&defendant=="white"])/
    sum(count[defendant=="white"])

## b)
dm <- glm(count~death*victim+death*defendant+
          victim*defendant,family=poisson(link=log))
summary(dm)
dm0 <- glm(count~death*victim+victim*defendant,
           family=poisson(link=log))
anova(dm0,dm,test="Chisq")

## Q.7 IRLS
y <- c(12,14,33,50,67,74,123,141,165,204,253,246,240)
t <-1:13
X <- cbind(rep(1,13),t,t^2) # model matrix
mu <- y;eta <- log(mu) # initial values
ok <- TRUE
while (ok) {
 ## evaluate pseudodata and weights
 z <- (y-mu)/mu + eta
 w <- as.numeric(mu)
 ## fit weighted working linear model
 z <- sqrt(w)*z; WX <- sqrt(w)*X
 beta <- coef(lm(z~WX-1))
 ## evaluate new eta and mu
 eta.old <- eta
 eta <- X%*%beta
 mu <- exp(eta)
 ## test for convergence...
 if (max(abs(eta-eta.old))<1e-7*max(abs(eta))) ok <- FALSE
}
plot(t,y);lines(t,mu) # plot fit

## Q.8
## b)
data(harrier)
m <- 1
b <- glm(Consumption.Rate~I(1/Grouse.Density^m),
     family=quasi(link=inverse,variance=mu),data=harrier)

## c)
plot(harrier$Grouse.Density,residuals(b))
## clear pattern if $m=1$, and the parameter estimates lead to a rather odd curve.

## d)
## search leads to...
m <- 3.25
b <- glm(Consumption.Rate~I(1/Grouse.Density^m),
     family=quasi(link=inverse,variance=mu),data=harrier)

## e)
pd <- data.frame(Grouse.Density = seq(0,130,length=200))
pr <- predict(b,newdata=pd,se=TRUE)
with(harrier,plot(Grouse.Density,Consumption.Rate))
lines(pd$Grouse.Density,1/pr$fit,col=2)
lines(pd$Grouse.Density,1/(pr$fit-pr$se*2),col=3)
lines(pd$Grouse.Density,1/(pr$fit+pr$se*2),col=3)

## f)
ll <- function(b,cr,d)
## evalates -ve quasi-log likelihood of model
## b is parameters, cr is consumption, d is density
{ ## get expected consumption...
  dm <- d^b[3]
  Ec <- exp(b[1])*dm/(1+exp(b[1])*exp(b[2])*dm)
  ## appropriate quasi-likelihood...
  ind <- cr>0    ## have to deal with cr==0 case
  ql <- cr - Ec
  ql[ind] <- ql[ind] + cr[ind]*log(Ec[ind]/cr[ind])
  -sum(ql)
}
## Now fit model ...
fit <- optim(c(log(.4),log(10),3),ll,method="L-BFGS-B",
             hessian=TRUE,cr=harrier$Consumption.Rate,
             d=harrier$Grouse.Density)
## and plot results ...
b <- fit$par
d <- seq(0,130,length=200); dm <- d^b[3]
Ec <- exp(b[1])*dm/(1+exp(b[1])*exp(b[2])*dm)
with(harrier,plot(Grouse.Density,Consumption.Rate))
lines(d,Ec,col=2)

## Q.9
death <- as.numeric(ldeaths)
month <- rep(1:12,6)
time <- 1:72
ldm <- glm(death ~ sin(month/12*2*pi)+cos(month/12*2*pi),
           family=poisson(link=identity))
plot(time,death,type="l");lines(time,fitted(ldm),col=2)
summary(ldm)
plot(ldm)

## Q.10
y <- c(12,14,33,50,67,74,123,141,165,204,253,246,240)
t <- 1:13
b <- glm(y ~ t + I(t^2),family=poisson)
log.lik <- b1 <- seq(.4,.7,length=100)
for (i in 1:100)
{ log.lik[i] <- logLik(glm(y~offset(b1[i]*t)+I(t^2),
                           family=poisson))
}
plot(b1,log.lik,type="l")
points(coef(b)[2],logLik(b),pch=19)
abline(logLik(b)[1]-qchisq(.95,df=1),0,lty=2)

## Q.11 Soybean
## a)
library(nlme)
attach(Soybean)
lmc <- lmeControl(niterEM=300) ## needed for convergence
m1<-lme(weight~Variety*Time+Variety*I(Time^2)+
        Variety*I(Time^3),Soybean,~Time|Plot,control=lmc)
plot(m1) ## clear increasing variance with mean

## b)
library(MASS)
m2<-glmmPQL(weight~Variety*Time+Variety*I(Time^2)+
    Variety*I(Time^3),data=Soybean,random=~Time|Plot,
    family=Gamma(link=log),control=lmc)
plot(m2) ## much better

## c)
m0<-glmmPQL(weight~Variety*Time+Variety*I(Time^2)+
    Variety*I(Time^3),data=Soybean,random=~1|Plot,
    family=Gamma(link=log),control=lmc) # simpler r.e.'s
m3<-glmmPQL(weight~Variety*Time+Variety*I(Time^2)+
    Variety*I(Time^3),data=Soybean,random=~Time+
    I(Time^2)|Plot,family=Gamma(link=log),control=lmc)
## ... m3 has more complex r.e. structure
## Following not strictly valid, but gives a rough
## guide. Suggests m2 is best...
AIC(m0,m2,m3)
summary(m2) ## drop Variety:Time
m4<-glmmPQL(weight~Variety+Time+Variety*I(Time^2)+
    Variety*I(Time^3),data=Soybean,random=~Time|Plot,
    family=Gamma(link=log),control=lmc)
summary(m4) ## perhaps drop Variety:I(Time^3)?
m5<-glmmPQL(weight~Variety+Time+Variety*I(Time^2)+
    I(Time^3),data=Soybean,random=~Time|Plot,
    family=Gamma(link=log),control=lmc)
summary(m5) ## don't drop any more
AIC(m2,m4,m5) ## supports m4
intervals(m5,which="fixed")

## So m4 or m5 are probably the best models to use, and
## both suggest that variety P has a higher weight on average.



