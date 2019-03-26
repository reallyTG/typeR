library(TransModel)


### Name: TransModel
### Title: Main function for fitting the linear transformation models for
###   right censored data
### Aliases: TransModel
### Keywords: Linear transformation models

### ** Examples

beta0 = c(1,-1)
# Fit proportional hazards model
data(PH_examp)
mod1<-TransModel(formula=Surv(time,status)~gender+age,data=PH_examp,r=0)
print(mod1)
summary(mod1)
mod1$coefficients
mod1$vcov
mod1$converged

# Fit proportional odds model
data(PO_examp)
mod2=TransModel(Surv(time,status)~gender+age,data=PO_examp,r=1)
print(mod2)
summary(mod2)



