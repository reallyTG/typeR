library(MedSurvey)


### Name: chisq.BRR
### Title: To adjust model fit statistics
### Aliases: chisq.BRR chisq.BRR-package

### ** Examples

## Don't show: 
 #Toy example for check:
R <- 20
wgtnames <- paste("repwgt", seq(0,R,by=1), sep="")
mwgtname=wgtnames[1]
repwgtnames=wgtnames[2:(R+1)]
fayfactor=0.5
model1 <- ' # outcome
             numcg ~ u2*1 + c*workban + b*sp_adltban
           # mediator
             sp_adltban ~ u1*1 + a*workban
           # indirect effect (a*b)
             ab := a*b
           # total effect
             total := c + (a*b)
          '
fit <- lavaan::sem(model=model1, data=MedData, estimator='ML', test='standard')
chisq.BRR(model1,fit,MedData,mwgtname, repwgtnames)
## End(Don't show)
## No test: 
R <- 160
wgtnames <- paste("repwgt", seq(0,R,by=1), sep="")
mwgtname=wgtnames[1]
repwgtnames=wgtnames[2:(R+1)]
fayfactor=0.5

############ Example 1
model1 <- ' # outcome
             numcg ~ u2*1 + c*workban + b*sp_adltban
           # mediator
             sp_adltban ~ u1*1 + a*workban
           # indirect effect (a*b)
             ab := a*b
           # total effect
             total := c + (a*b)
          '
fit <- lavaan::sem(model=model1, data=MedData, estimator='ML', test='standard')
chisq.BRR(model1,fit,MedData,mwgtname, repwgtnames)
#
# lavaan 0.6-3 ended normally after 24 iterations
#
# Optimization method                           NLMINB
# Number of free parameters                          7
#
# Number of observations                          3922
#
# Estimator                                         ML      Robust
# Model Fit Test Statistic                       0.000       0.000
# Degrees of freedom                                 0           0
# Scaling correction factor                                     NA
# for the Satorra-Bentler correction#'

############ Example 2

model3 <- ' # outcome
            numcg ~ u0*1 + c*workban + b1*sp_adltban + b2*sp_kidsban
           # mediator
              sp_adltban ~ u1*1 + a1*workban
              sp_kidsban ~ u2*1 + a2*workban
           # indirect effect (a*b)
              a1b1 := a1*b1
             a2b2 := a2*b2
           # total effect
             total := c + (a1*b1) + (a2*b2)
          '

fit <- lavaan::sem(model=model3, data=MedData, estimator='ML', test='standard')
chisq.BRR(model3,fit,MedData,mwgtname, repwgtnames)

#       MedSurvey 1.0
#
# lavaan 0.6-3 ended normally after 27 iterations
#
# Optimization method                           NLMINB
# Number of free parameters                         11
#
# Number of observations                          3922
#
# Estimator                                         ML      Robust
# Model Fit Test Statistic                     305.248      70.973
# Degrees of freedom                                 1           1
# P-value (Chi-square)                           0.000       0.000
# Scaling correction factor                                  4.301
# for the Satorra-Bentler correction

## End(No test)




