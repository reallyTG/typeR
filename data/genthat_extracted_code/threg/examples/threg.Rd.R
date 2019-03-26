library(threg)


### Name: threg
### Title: fit a threshold regression model
### Aliases: threg
### Keywords: models survival analysis threshold regression hazard ratio

### ** Examples

#load the data "lkr"
data("lkr")

#Transform the "treatment2" variable into factor variable "f.treatment2" .
lkr$f.treatment2=factor(lkr$treatment2)

#fit the threshold regression model on the factor variable "f.treatment2", 
fit<-threg(Surv(weeks, relapse)~ f.treatment2|f.treatment2,data = lkr)
fit

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




