library(prodlim)


### Name: summary.prodlim
### Title: Summary method for prodlim objects.
### Aliases: summary.prodlim
### Keywords: survival

### ** Examples


library(lava)
set.seed(17)
m <- survModel()
distribution(m,~age) <- uniform.lvm(30,80)
distribution(m,~sex) <- binomial.lvm()
m <- categorical(m,~z,K=3)
regression(m,eventtime~age) <- 0.01
regression(m,eventtime~sex) <- -0.4
d <- sim(m,50)
d$sex <- factor(d$sex,levels=c(0,1),labels=c("female","male"))
d$Z <- factor(d$z,levels=c(1,0,2),labels=c("B","A","C"))

# Univariate Kaplan-Meier
# -----------------------------------------------------------------------------------------
fit0 <- prodlim(Hist(time,event)~1,data=d)
summary(fit0)

## show survival probabilities as percentage and
## count number of events within intervals of a
## given time-grid:
summary(fit0,times=c(1,5,10,12),percent=TRUE,intervals=TRUE)

## the result of summary has a print function
## which passes ... to print and print.listof
sx <- summary(fit0,times=c(1,5,10,12),percent=TRUE,intervals=TRUE)
print(sx,digits=3)

## show cumulative incidences (1-survival)
summary(fit0,times=c(1,5,10,12),surv=FALSE,percent=TRUE,intervals=TRUE)

# Stratified Kaplan-Meier
# -----------------------------------------------------------------------------------------

fit1 <- prodlim(Hist(time,event)~sex,data=d)
print(summary(fit1,times=c(1,5,10),intervals=TRUE,percent=TRUE),digits=3)

summary(fit1,times=c(1,5,10),asMatrix=TRUE,intervals=TRUE,percent=TRUE)

fit2 <- prodlim(Hist(time,event)~Z,data=d)
print(summary(fit2,times=c(1,5,10),intervals=TRUE,percent=TRUE),digits=3)

## Continuous strata (Beran estimator)
# -----------------------------------------------------------------------------------------
fit3 <- prodlim(Hist(time,event)~age,data=d)
print(summary(fit3,
              times=c(1,5,10),
              newdata=data.frame(age=c(20,50,70)),
              intervals=TRUE,
              percent=TRUE),digits=3)

## stratified Beran estimator
# -----------------------------------------------------------------------------------------
fit4 <- prodlim(Hist(time,event)~age+sex,data=d)
print(summary(fit4,
              times=c(1,5,10),
              newdata=data.frame(age=c(20,50,70),sex=c("female","male","male")),
              intervals=TRUE,
              percent=TRUE),digits=3)

print(summary(fit4,
              times=c(1,5,10),
              newdata=data.frame(age=c(20,50,70),sex=c("female","male","male")),
              intervals=TRUE,collapse=TRUE,
              percent=TRUE),digits=3)

## assess results from summary
x <- summary(fit4,times=10,newdata=expand.grid(age=c(60,40,50),sex=c("male","female")))
cbind(names(x$table),do.call("rbind",lapply(x$table,round,2)))

x <- summary(fit4,times=10,newdata=expand.grid(age=c(60,40,50),sex=c("male","female")))

## Competing risks: Aalen-Johansen
# -----------------------------------------------------------------------------------------
d <- SimCompRisk(30)
crfit <- prodlim(Hist(time,event)~X1,data=d)
summary(crfit,times=c(1,2,5))
summary(crfit,times=c(1,2,5),cause=1,intervals=TRUE)
summary(crfit,times=c(1,2,5),cause=1,asMatrix=TRUE)
summary(crfit,times=c(1,2,5),cause=1:2,asMatrix=TRUE)


# extract the actual tables from the summary 
sumfit <- summary(crfit,times=c(1,2,5),print=FALSE)
sumfit$table[[1]] # cause 1
sumfit$table[[2]] # cause 2


# '



