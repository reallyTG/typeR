library(NestedCohort)


### Name: NestedCohort-package
### Title: Survival Analysis of Cohort Studies With Missing Covariate
###   Information ~~ NestedCohort ~~
### Aliases: NestedCohort-package NestedCohort
### Keywords: survival survey

### ** Examples


# Get zinc dataset
data(zinc)

# Fit and plot Kaplan-Meier
mod <- nested.km(survfitformula="Surv(futime01,ec01==1)~znquartiles",
                 samplingmod="ec01*basehist",data=zinc)
plot(mod,ymin=.6,xlab="Time (Days)",ylab="Survival",main="Survival by Quartile of Zinc",lty=1:4,)
legend(2000,0.7,c("Q1","Q2","Q3","Q4"),lty=1:4)

# Fit Cox model, get hazard ratios
coxmod <- nested.coxph(coxformula="Surv(futime01,ec01==1)~
          sex+agepill+smoke+drink+mildysp+moddysp+sevdysp+anyhist+zncent",
          samplingmod="ec01*basehist",data=zinc)
summary(coxmod)

# Fit Cox model, get and plot standardized survivals, survival differences, and attributable risks
mod <- nested.stdsurv(outcome="Surv(futime01,ec01==1)",
                      exposures="znquartiles",
                      confounders="sex+agestr+smoke+drink+mildysp+moddysp+sevdysp+anyhist",
                      samplingmod="ec01*basehist",exposureofinterest="Q4",plot=TRUE,
                      main="Time to Esophageal Cancer by Quartiles of Zinc",data=zinc)




