library(riskRegression)


### Name: ate
### Title: Compute the Average Treatment Effects Via the G-formula
### Aliases: ate

### ** Examples

library(survival)
library(rms)

set.seed(10)

#### Survival settings  ####
#### ATE with Cox model ####

## generate data
n <- 100
dtS <- sampleData(n, outcome="survival")
dtS$time <- round(dtS$time,1)
dtS$X1 <- factor(rbinom(n, prob = c(0.3,0.4) , size = 2), labels = paste0("T",0:2))

## estimate the Cox model
fit <- cph(formula = Surv(time,event)~ X1+X2,data=dtS,y=TRUE,x=TRUE)

## compute the ATE at times 5, 6, 7, and 8 using X1 as the treatment variable
## Not run: 
##D ## only punctual estimate (argument se = FALSE)
##D ateFit1a <- ate(fit, data = dtS, treatment = "X1", times = 5:8,
##D                se = TRUE)
##D 
##D ## standard error / confidence intervals computed using the influence function
##D ## (argument se = TRUE and B = 0)
##D ateFit1b <- ate(fit, data = dtS, treatment = "X1", times = 5:8,
##D                se = TRUE, B = 0)
##D 
##D ## same as before with in addition the confidence bands for the ATE
##D ## (argument band = TRUE)
##D ateFit1c <- ate(fit, data = dtS, treatment = "X1", times = 5:8,
##D                se = TRUE, band = TRUE, B = 0)
##D 
##D ## bootstrap confidence intervals
##D ateFit1c <- ate(fit, data = dtS, treatment = "X1", times = 5,
##D                seed = 3, se = TRUE, B = 100)
##D 
##D ## standard error / confidence intervals computed using 100 boostrap samples
##D ## (argument se = TRUE and B = 100) 
##D ateFit1d <- ate(fit, data = dtS, treatment = "X1",
##D                 times = 5:8, se = TRUE, B = 100)
##D ## NOTE: for real applications 100 bootstrap samples is not enougth 
##D 
##D ## same but using 2 cpus for generating and analyzing the boostrap samples
##D ## (parallel computation, argument mc.cores = 2) 
##D ateFit1e <- ate(fit, data = dtS, treatment = "X1",
##D                 times = 5:8, se = TRUE, B = 100, mc.cores = 2)
## End(Not run)

#### Survival settings without censoring ####
#### ATE with glm                        ####

## generate data
n <- 100
dtS <- sampleData(n, outcome="survival")
dtS[, event5 := eventtime<=5]
dtS[, X2 := as.numeric(X2)]

## estimate the Cox model
fit <- glm(formula = event5 ~ X1+X2, data=dtS, family = "binomial")

## compute the ATE at times 5 using X1 as the treatment variable
## only punctual estimate (argument se = FALSE)
ateFit1a <- ate(fit, data = dtS, treatment = "X1", times = 5,
               se = FALSE)
ateFit1a

## Not run: 
##D ## standard error / confidence intervals computed using the influence function
##D ateFit1b <- ate(fit, data = dtS, treatment = "X1", times = 5,
##D                se = TRUE, B = 0)
##D ateFit1b
##D 
##D ## standard error / confidence intervals computed using 100 boostrap samples
##D ateFit1d <- ate(fit, data = dtS, treatment = "X1",
##D                 times = 5, se = TRUE, B = 100)
##D ateFit1d
##D 
##D ## using lava
##D ateLava <- estimate(fit, function(p, data){
##D a <- p["(Intercept)"] ; b <- p["X11"] ; c <- p["X2"] ;
##D R.X11 <- expit(a + b + c * data[["X2"]])
##D R.X10 <- expit(a + c * data[["X2"]])
##D list(risk0=R.X10,risk1=R.X11,riskdiff=R.X10-R.X11)},
##D average=TRUE)
##D ateLava
## End(Not run)

#### Competing risks settings               ####
#### ATE with cause specific Cox regression ####

## Not run: 
##D ## generate data
##D n <- 500
##D dt <- sampleData(n, outcome="competing.risks")
##D dt$time <- round(dt$time,1)
##D dt$X1 <- factor(rbinom(n, prob = c(0.2,0.3,0.2) , size = 3), labels = paste0("T",0:3))
##D 
##D ## estimate cause specific Cox model
##D fitCR <-  CSC(Hist(time,event)~ X1+X8,data=dt,cause=1)
##D 
##D ## compute the ATE at times 5, 6, 7, and 8 using X1 as the treatment variable
##D ateFit2a <- ate(fitCR, data = dt, treatment = "X1", times = 5:8, cause = 1,
##D                se = FALSE)
##D 
##D ## standard error / confidence intervals computed using the influence function
##D ## (argument se = TRUE and B = 0)
##D ateFit2b <- ate(fitCR, data = dt, treatment = "X1", times = 5:8, cause = 1,
##D                se = TRUE, B = 0)
##D 
##D ## same as before with in addition the confidence bands for the ATE
##D ## (argument band = TRUE)
##D ateFit2c <- ate(fitCR, data = dt, treatment = "X1", times = 5:8, cause = 1,
##D                se = TRUE, band = TRUE, B = 0)
##D 
##D ## standard error / confidence intervals computed using 100 boostrap samples
##D ## (argument se = TRUE and B = 100) 
##D ateFit2d <- ate(fitCR, data = dt, treatment = "X1", times = 5:8, cause = 1,
##D                 se = TRUE, B = 100)
##D ## NOTE: for real applications 100 bootstrap samples is not enougth 
##D 
##D ## same but using 2 cpus for generating and analyzing the boostrap samples
##D ## (parallel computation, argument mc.cores = 2) 
##D ateFit2e <- ate(fitCR, data = dt, treatment = "X1", times = 5:8, cause = 1,
##D                 se = TRUE, B = 100, mc.cores = 2)
## End(Not run)

#### time-dependent covariates ###
## Not run: 
##D library(survival)
##D fit <- coxph(Surv(time, status) ~ celltype+karno + age + trt, veteran)
##D vet2 <- survSplit(Surv(time, status) ~., veteran,
##D                        cut=c(60, 120), episode ="timegroup")
##D fitTD <- coxph(Surv(tstart, time, status) ~ celltype+karno + age + trt,
##D                data= vet2,x=1)
##D set.seed(16)
##D resVet <- ate(fitTD,formula=Hist(entry=tstart,time=time,event=status)~1,
##D           data = vet2, treatment = "celltype", contrasts = NULL,
##D         times=5,verbose=1,
##D         landmark = c(0,30,60,90), cause = 1, B = 4, se = 1,
##D         band = FALSE, mc.cores=1)
##D resVet
## End(Not run)

## Not run: 
##D set.seed(137)
##D d=sampleDataTD(127)
##D library(survival)
##D d[,status:=1*(event==1)]
##D ## ignore competing risks
##D cox1TD <- coxph(Surv(start,time, status,type="counting") ~ X3+X5+X6+X8, data=d)
##D resTD1 <- ate(cox1TD,formula=Hist(entry=start,time=time,event=status)~1,
##D         data = d, treatment = "X3", contrasts = NULL,
##D         times=.5,verbose=1,
##D         landmark = c(0,0.5,1), B = 20, se = 1,
##D         band = FALSE, mc.cores=1)
##D resTD1
##D ## adjust for competing risks
##D cscTD <- CSC(Hist(time=time, event=event,entry=start) ~ X3+X5+X6+X8, data=d)
##D set.seed(16)
##D resTD <- ate(cscTD,formula=Hist(entry=start,time=time,event=event)~1,
##D         data = d, treatment = "X3", contrasts = NULL,
##D         times=.5,verbose=1,
##D         landmark = c(0,0.5,1), cause = 1, B = 20, se = 1,
##D         band = FALSE, mc.cores=1)
##D resTD
## End(Not run)



