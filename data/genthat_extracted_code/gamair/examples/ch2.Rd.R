library(gamair)


### Name: ch2
### Title: Code for Chapter 2: Linear Mixed Models
### Aliases: ch2

### ** Examples

library(gamair); library(mgcv)

## 2.1.1
data(stomata)
m1 <- lm(area ~ CO2 + tree,stomata)
m0 <- lm(area ~ CO2,stomata)
anova(m0,m1)
m2 <- lm(area ~ tree,stomata)
anova(m2,m1)
st <- aggregate(data.matrix(stomata),
                by=list(tree=stomata$tree),mean)
st$CO2 <- as.factor(st$CO2);st
m3 <- lm(area~CO2,st)
anova(m3)
summary(m3)$sigma^2 - summary(m1)$sigma^2/4

## 2.1.3
library(nlme)  # load nlme `library', which contains data
data(Rail)     # load data
Rail
m1 <- lm(travel ~ Rail,Rail)
anova(m1)
rt <- aggregate(data.matrix(Rail),by=list(Rail$Rail),mean)
rt
m0 <- lm(travel ~ 1,rt)   # fit model to aggregated data
sigb <- (summary(m0)$sigma^2-summary(m1)$sigma^2/3)^0.5
# sigb^2 is variance component for rail
sig <- summary(m1)$sigma # sig^2 is resid. var. component
sigb
sig
summary(m0)

## 2.1.4
library(nlme)
data(Machines)
names(Machines)
attach(Machines)  # make data available without `Machines$'
interaction.plot(Machine,Worker,score)
m1 <- lm(score ~ Worker*Machine,Machines)
m0 <- lm(score ~ Worker + Machine,Machines)
anova(m0,m1)
summary(m1)$sigma^2
Mach <- aggregate(data.matrix(Machines),by=
        list(Machines$Worker,Machines$Machine),mean)
Mach$Worker <- as.factor(Mach$Worker)
Mach$Machine <- as.factor(Mach$Machine)
m0 <- lm(score ~ Worker + Machine,Mach)
anova(m0)
summary(m0)$sigma^2 - summary(m1)$sigma^2/3
M <- aggregate(data.matrix(Mach),by=list(Mach$Worker),mean)
m00 <- lm(score ~ 1,M)
summary(m00)$sigma^2 - (summary(m0)$sigma^2)/3

## 2.4.4
llm <- function(theta,X,Z,y) {
  ## untransform parameters...
  sigma.b <- exp(theta[1])
  sigma <- exp(theta[2])
  ## extract dimensions...
  n <- length(y); pr <- ncol(Z); pf <- ncol(X)
  ## obtain \hat \beta, \hat b...
  X1 <- cbind(X,Z)
  ipsi <- c(rep(0,pf),rep(1/sigma.b^2,pr))
  b1 <- solve(crossprod(X1)/sigma^2+diag(ipsi),
              t(X1)%*%y/sigma^2)
  ## compute log|Z'Z/sigma^2 + I/sigma.b^2|...
  ldet <- sum(log(diag(chol(crossprod(Z)/sigma^2 + 
              diag(ipsi[-(1:pf)])))))
  ## compute log profile likelihood...
  l <- (-sum((y-X1%*%b1)^2)/sigma^2 - sum(b1^2*ipsi) - 
  n*log(sigma^2) - pr*log(sigma.b^2) - 2*ldet - n*log(2*pi))/2
  attr(l,"b") <- as.numeric(b1) ## return \hat beta and \hat b
  -l 
}
library(nlme) ## for Rail data
options(contrasts=c("contr.treatment","contr.treatment"))
Z <- model.matrix(~Rail$Rail-1) ## r.e. model matrix
X <- matrix(1,18,1)             ## fixed model matrix
## fit the model...
rail.mod <- optim(c(0,0),llm,hessian=TRUE,
                           X=X,Z=Z,y=Rail$travel)
exp(rail.mod$par) ## variance components
solve(rail.mod$hessian) ## approx cov matrix for theta 
attr(llm(rail.mod$par,X,Z,Rail$travel),"b")

## 2.5.1
library(nlme)
lme(travel~1,Rail,list(Rail=~1))

## 2.5.2

Loblolly$age <- Loblolly$age - mean(Loblolly$age)
lmc <- lmeControl(niterEM=500,msMaxIter=100)
m0 <- lme(height ~ age + I(age^2) + I(age^3),Loblolly,
          random=list(Seed=~age+I(age^2)+I(age^3)),
          correlation=corAR1(form=~age|Seed),control=lmc)
plot(m0)
m1 <- lme(height ~ age+I(age^2)+I(age^3)+I(age^4),Loblolly,
          list(Seed=~age+I(age^2)+I(age^3)),
          cor=corAR1(form=~age|Seed),control=lmc)
plot(m1)
m2 <- lme(height~age+I(age^2)+I(age^3)+I(age^4)+I(age^5),
          Loblolly,list(Seed=~age+I(age^2)+I(age^3)),
          cor=corAR1(form=~age|Seed),control=lmc)
plot(m2)
plot(m2,Seed~resid(.))
qqnorm(m2,~resid(.))
qqnorm(m2,~ranef(.))

m3 <- lme(height~age+I(age^2)+I(age^3)+I(age^4)+I(age^5),
          Loblolly,list(Seed=~age+I(age^2)+I(age^3)),control=lmc)
anova(m3,m2)
m4 <- lme(height~age+I(age^2)+I(age^3)+I(age^4)+I(age^5),
          Loblolly,list(Seed=~age+I(age^2)),
          correlation=corAR1(form=~age|Seed),control=lmc)
anova(m4,m2)
m5 <- lme(height~age+I(age^2)+I(age^3)+I(age^4)+I(age^5),
          Loblolly,list(Seed=pdDiag(~age+I(age^2)+I(age^3))),
          correlation=corAR1(form=~age|Seed),control=lmc)
anova(m2,m5)
plot(augPred(m2))

## 2.5.3
lme(score~Machine,Machines,list(Worker=~1,Machine=~1))

## 2.5.4
library(lme4)
a1 <- lmer(score~Machine+(1|Worker)+(1|Worker:Machine),
           data=Machines)
a1
a2 <- lmer(score~Machine+(1|Worker)+(Machine-1|Worker),
           data=Machines)
AIC(a1,a2)
anova(a1,a2)

## 2.5.5
library(mgcv)
b1 <- gam(score~ Machine + s(Worker,bs="re") + 
      s(Machine,Worker,bs="re"),data=Machines,method="REML")
gam.vcomp(b1)
b2 <- gam(score~ Machine + s(Worker,bs="re") + 
      s(Worker,bs="re",by=Machine),data=Machines,method="REML")
gam.vcomp(b2)




