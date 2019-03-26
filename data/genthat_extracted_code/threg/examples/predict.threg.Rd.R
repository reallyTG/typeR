library(threg)


### Name: predict.threg
### Title: predictions for threshold regression model
### Aliases: predict.threg
### Keywords: models survival analysis threshold regression prediction

### ** Examples


#load the data "bmt"
data("bmt")

#Transform the "group" and "fab" variables into factor variables 
#"f.group" and "f.fab".
bmt$f.group=factor(bmt$group)
bmt$f.fab=factor(bmt$fab)

#fit a threshold regression model on the "bmt" dataset, by using "recipient_age" and 
#"f.fab" as the predictors for ln(y0), and "f.group" and "f.fab" as predictors for mu.
fit<-threg(Surv(time, indicator)~ recipient_age+f.fab|f.group+f.fab, data = bmt)

#predict lny0, y0, mu, f, S and h for the specified scenario that "the patient age is 
#18 years old, the FAB classification is 0 and the risk category is 3", at the 
#time ``2000 days''
predict.threg(fit,timevalue=2000,scenario=recipient_age(18)+f.fab1(0)+f.group2(0)+f.group3(1))




