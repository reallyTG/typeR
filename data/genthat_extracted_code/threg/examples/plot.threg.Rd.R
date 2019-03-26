library(threg)


### Name: plot.threg
### Title: Plot curves of the estimated survival, hazard or density
###   functions for threshold regression model
### Aliases: plot.threg
### Keywords: models survival analysis threshold regression plot

### ** Examples

#load the data "lkr"
data("lkr")

#Transform the "treatment2" variable into factor variable "f.treatment2" .
lkr$f.treatment2=factor(lkr$treatment2)

#fit the threshold regression model on the factor variable "f.treatment2", 
fit<-threg(Surv(weeks, relapse)~ f.treatment2|f.treatment2,data = lkr)
fit

#generate the predicted survival curves for the drug B group and 
#the standard group.
plot(fit,var=f.treatment2,graph=sv,nolegend=1,nocolor=1)
legend(20, 1, c("Standard","Drug B"), lty = 1:2) 



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

#fit the same model as above, but additionally overlay curves of survival functions 
#corresponding to different levels of "f.group'.
plot.threg(fit,var=f.group,scenario=recipient_age(18)+f.fab1(0),graph=sv,nocolor=1)


#fit the same model as above, but additionally overlay curves of hazard functions 
#corresponding to different levels of "f.group'.
plot.threg(fit,var=f.group,scenario=recipient_age(18)+f.fab1(0),graph=hz,nocolor=1)

#fit the same model as above, but additionally overlay curves of probability density 
#functions corresponding to different levels of "f.group'.
plot.threg(fit,var=f.group,scenario=recipient_age(18)+f.fab1(0),graph=ds,nocolor=1)




