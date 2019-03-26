## ------------------------------------------------------------------------
options(width=75)
library(phmm)

n <- 50      # total sample size
nclust <- 5  # number of clusters
clusters <- rep(1:nclust,each=n/nclust)
beta0 <- c(1,2)
set.seed(13)

Z <-cbind(Z1=sample(0:1,n,replace=TRUE),
          Z2=sample(0:1,n,replace=TRUE),
          Z3=sample(0:1,n,replace=TRUE))
b <- cbind(rep(rnorm(nclust), each=n/nclust),
           rep(rnorm(nclust), each=n/nclust))
Wb <- matrix(0,n,2)
for( j in 1:2) Wb[,j] <- Z[,j]*b[,j]
Wb <- apply(Wb,1,sum)
T <- -log(runif(n,0,1))*exp(-Z[,c('Z1','Z2')]%*%beta0-Wb)
C <- runif(n,0,1)
time <- ifelse(T<C,T,C)
event <- ifelse(T <= C,1,0)
sum(event)
phmmd <- data.frame(Z)
phmmd$cluster <- clusters
phmmd$time <- time
phmmd$event <- event

## ------------------------------------------------------------------------
fit.ph <- coxph(Surv(time, event) ~ Z1 + Z2, 
   phmmd, method="breslow", x=TRUE, y=TRUE)

summary(fit.ph)

## ------------------------------------------------------------------------
ppd <- as.data.frame(as.matrix(pseudoPoisPHMM(fit.ph)))

# pois likelihood
poisl <- c()
eventtimes <- sort(phmmd$time[phmmd$event == 1])
for(h in 1:length(eventtimes)){
  js <- ppd$time == eventtimes[h] & ppd$m >= 1  # j star
  j  <- ppd$time == eventtimes[h]
  if(sum(js) > 1) stop("tied event times")
  poisl <- c(poisl, 
    ppd[js, "N"]*exp(-1)*exp(ppd[js, "linear.predictors"])/
    sum(ppd[j, "N"]*exp(ppd[j, "linear.predictors"])))
}

## ------------------------------------------------------------------------
(coxph.pois.loglik = sum(log(poisl)))
coxph.pois.loglik - fit.ph$loglik[2]

## ------------------------------------------------------------------------
(coxph.pois.df = length(fit.ph$coef) + sum(phmmd$event))

## ------------------------------------------------------------------------
ppd$t <- as.factor(ppd$time)
fit.glm <- glm(m~-1+t+z1+z2+offset(log(N)), 
  ppd, family=poisson)

summary(fit.glm)

cbind(coxph.coef = fit.ph$coef, glm.coef = coef(fit.glm)[c('z1', 'z2')])
cbind(coxph.pois.loglik, glm.loglik=logLik(fit.glm))

## ------------------------------------------------------------------------
bh <- basehaz(fit.ph, centered = FALSE)
cbind(
  coxph.bh.step = log(bh$hazard - c(0,bh$hazard[1:(length(bh$hazard)-1)]))[1:5],
  glm.bh.step = coef(fit.glm)[1:5]
)

## ------------------------------------------------------------------------
fit.phmm <- phmm(Surv(time, event) ~ Z1 + Z2 + (Z1 + Z2|cluster), 
   phmmd, Gbs = 100, Gbsvar = 1000, VARSTART = 1,
   NINIT = 10, MAXSTEP = 100, CONVERG=90)
summary(fit.phmm)

## ------------------------------------------------------------------------
ppd <- as.data.frame(as.matrix(pseudoPoisPHMM(fit.phmm)))

poisl <- c()
eventtimes <- sort(phmmd$time[phmmd$event == 1])
for(h in 1:length(eventtimes)){
  js <- ppd$time == eventtimes[h] & ppd$m >= 1  # j star
  j  <- ppd$time == eventtimes[h]
  if(sum(js) > 1) stop("tied event times")
  poisl <- c(poisl, 
    ppd[js, "N"]*exp(-1)*exp(ppd[js, "linear.predictors"])/
    sum(ppd[j, "N"]*exp(ppd[j, "linear.predictors"])))
}

## ------------------------------------------------------------------------
phmm.pois.loglik = sum(log(poisl))
phmm.pois.loglik - fit.phmm$loglik[1]

## ------------------------------------------------------------------------
# Poisson GLMM degrees of freedom  length(unique(x$cluster)) * x$nrandom + x$nfixed
traceHat(fit.phmm, "pseudoPois") # + 2*sum(phmmd$event)

## ----message = FALSE, warning = FALSE------------------------------------
library(lme4)
ppd$t <- as.factor(ppd$time)
fit.lmer <- glmer(m~-1+t+z1+z2+
  (z1+z2|cluster)+offset(log(N)), 
  data=ppd, family=poisson, nAGQ=0)

summary(fit.lmer)$coef
fit.phmm$coef
logLik(fit.lmer)

phmm.pois.loglik - logLik(fit.lmer)[1]

## ------------------------------------------------------------------------
cbind(
  phmm.bh.step = log(fit.phmm$lambda)[1:5],
  glm.bh.step = fixef(fit.lmer)[1:5]
)

