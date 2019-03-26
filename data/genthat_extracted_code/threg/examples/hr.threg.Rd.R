library(threg)


### Name: hr
### Title: Hazard ratio calculation for threshold regression model
### Aliases: hr hr.threg
### Keywords: models survival analysis threshold regression hazard ratio

### ** Examples

#load the data "lkr"
data("lkr")

#Transform the "treatment2" variable into factor variable "f.treatment2" .
lkr$f.treatment2=factor(lkr$treatment2)

#fit the threshold regression model on the factor variable "f.treatment2", 
fit<-threg(Surv(weeks, relapse)~ f.treatment2|f.treatment2,data = lkr)
fit

#calculate the hazard ratio of the drug B group v.s. the standard group at 
#week 5 (this hazard ratio is calculated as 2.08)
hr.threg(fit,var=f.treatment2,timevalue=5)

#calculate the hazard ratio of the drug B group v.s. the standard group at 
#week 20 (this hazard ratio is calculated as 0.12)
hr.threg(fit,var=f.treatment2,timevalue=20)

#As a comparison, fit the Cox proportion hazards model on "f.treatment2", 
#and the Cox model gives a constant hazard ratio, 0.73.
summary(coxph(Surv(weeks, relapse) ~ f.treatment2, data = lkr))



#load the data "bmt"
data("bmt")

#Transform the "group" and "fab" variables into factor variables 
#"f.group" and "f.fab".
bmt$f.group=factor(bmt$group)
bmt$f.fab=factor(bmt$fab)

#fit a threshold regression model on the "bmt" dataset, by using "recipient_age" and 
#"f.fab" as the predictors for ln(y0), and "f.group" and "f.fab" as predictors for mu.
fit<-threg(Surv(time, indicator)~ recipient_age+f.fab|f.group+f.fab, data = bmt)
fit

#Calculate the hazard ratio for 
#"f.group" for the specified scenario that "the patient age is 18 years old and 
#the FAB classification is 0", at the time ``500 days''.
hr.threg(fit,var=f.group,timevalue=500,scenario=recipient_age(18)+f.fab1(0))





