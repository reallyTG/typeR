library(pec)


### Name: plot.pec
### Title: Plotting prediction error curves
### Aliases: plot.pec
### Keywords: survival

### ** Examples



# simulate data
# with a survival response and two predictors
library(prodlim)
library(survival)
set.seed(280180)
dat <- SimSurv(100)

# fit some candidate Cox models and
# compute the Kaplan-Meier estimate 

Models <- list("Kaplan.Meier"=survfit(Surv(time,status)~1,data=dat),
               "Cox.X1"=coxph(Surv(time,status)~X1,data=dat,x=TRUE,y=TRUE),
               "Cox.X2"=coxph(Surv(time,status)~X2,data=dat,x=TRUE,y=TRUE),
               "Cox.X1.X2"=coxph(Surv(time,status)~X1+X2,data=dat,x=TRUE,y=TRUE))
Models <- list("Cox.X1"=coxph(Surv(time,status)~X1,data=dat,x=TRUE,y=TRUE),
               "Cox.X2"=coxph(Surv(time,status)~X2,data=dat,x=TRUE,y=TRUE),
               "Cox.X1.X2"=coxph(Surv(time,status)~X1+X2,data=dat,x=TRUE,y=TRUE))


# compute the .632+ estimate of the generalization error 
set.seed(17100)
PredError.632plus <- pec(object=Models,
                         formula=Surv(time,status)~X1+X2,
                         data=dat,
                         exact=TRUE,
                         cens.model="marginal",
                         splitMethod="boot632plus",
                         B=5,
                         keep.matrix=TRUE,
                         verbose=TRUE)

# plot the .632+ estimates of the generalization error 
plot(PredError.632plus,xlim=c(0,30))

# plot the bootstrapped curves, .632+ estimates of the generalization error
# and Apparent error for the Cox model 'Cox.X1' with the 'Cox.X2' model
# as benchmark
plot(PredError.632plus,
     xlim=c(0,30),
     models="Cox.X1",
     special=TRUE,
     special.bench="Cox.X2",
     special.benchcol=2,
     special.addprederr="AppErr")





