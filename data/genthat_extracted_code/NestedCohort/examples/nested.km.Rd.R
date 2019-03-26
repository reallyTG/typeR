library(NestedCohort)


### Name: nested.km
### Title: Estimate non-parametric survival curves for each level of
###   categorical variables with missing data.
### Aliases: nested.km
### Keywords: models

### ** Examples

## Simple analysis of zinc and esophageal cancer data:
## We sampled zinc (variable znquartiles) on a fraction of the subjects, with
## sampling fractions depending on cancer status and baseline histology.
## We observed the confounding variables on almost all subjects.
data(zinc)
mod <- nested.km(survfitformula="Surv(futime01,ec01==1)~znquartiles",
                 samplingmod="ec01*basehist",data=zinc)

# This is the output
#  Risk Differences vs. znquartiles=Q1 by time Inf 
#          Risk Difference StdErr 95% CI Left 95% CI Right
#  Q1 - Q2         -0.2262 0.1100     -0.4419     -0.01060
#  Q1 - Q3         -0.1749 0.1145     -0.3993      0.04945
#  Q1 - Q4         -0.2818 0.1042     -0.4859     -0.07760

plot(mod,ymin=.6,xlab="Time (Days)",ylab="Survival",main="Survival by Quartile of Zinc",lty=1:4,)
legend(2000,0.7,c("Q1","Q2","Q3","Q4"),lty=1:4)



