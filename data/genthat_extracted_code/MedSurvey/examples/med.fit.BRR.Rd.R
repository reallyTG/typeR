library(MedSurvey)


### Name: med.fit.BRR
### Title: To estimate the mediation effects and adjust standard errors for
###   complex surveys with balanced repeated replications
### Aliases: med.fit.BRR

### ** Examples

## Don't show: 
 #Toy example for check:
R <- 20
wgtnames <- paste("repwgt", seq(0,R,by=1), sep="")
mwgtname=wgtnames[1]
repwgtnames=wgtnames[2:(R+1)]
model1 <- ' # outcome
             numcg ~ u2*1 + c*workban + b*sp_adltban
           # mediator
             sp_adltban ~ u1*1 + a*workban
           # indirect effect (a*b)
             ab := a*b
           # total effect
             total := c + (a*b)
          '
fit.BRR <- med.fit.BRR(model=model1, data=MedData, mwgtname=mwgtname,
         repwgtnames=repwgtnames, fayfactor=0.5)
lavaan::summary(fit.BRR)
## End(Don't show)
## No test: 
R <- 160
wgtnames <- paste("repwgt", seq(0,R,by=1), sep="")
mwgtname=wgtnames[1]
repwgtnames=wgtnames[2:(R+1)]

model2 <- ' # outcome
              numcg ~ u0*1 + c*workban + b1*sp_adltban + b2*sp_kidsban
            # mediator
              sp_adltban ~ u1*1 + a1*workban
              sp_kidsban ~ u2*1 + a2*workban
            #covariance of residuals
              sp_adltban ~~ sp_kidsban
            # indirect effect (a*b)
              a1b1 := a1*b1
              a2b2 := a2*b2
            # total effect
              total := c + (a1*b1) + (a2*b2)
           '
fit.BRR <- med.fit.BRR(model=model2, data=MedData, mwgtname=mwgtname,
         repwgtnames=repwgtnames, fayfactor=0.5)
lavaan::summary(fit.BRR)
#
# lavaan 0.6-3 ended normally after 41 iterations
#
# Optimization method                           NLMINB
# Number of free parameters                         12
#
# Number of observations                          3922
#
# Estimator                                         ML      Robust
# Model Fit Test Statistic                       0.000       0.000
# Degrees of freedom                                 0           0
# Minimum Function Value               0.0000000000000
# Scaling correction factor                                     NA
# for the Satorra-Bentler correction
#
# Parameter Estimates:
#
#   Information                                 Expected
# Information saturated (h1) model          Structured
# Standard Errors                                  BRR
#
# Regressions:
#                    Estimate  Std.Err  z-value  P(>|z|)
# numcg ~
#    workban    (c)   -0.101    0.039   -2.572    0.010
#    sp_adltbn (b1)   -0.253    0.048   -5.270    0.000
#    sp_kidsbn (b2)   -0.361    0.051   -7.006    0.000
# sp_adltban ~
#    workban   (a1)    0.069    0.018    3.753    0.000
# sp_kidsban ~
#    workban   (a2)    0.020    0.016    1.250    0.211
#
# Covariances:
#                    Estimate  Std.Err  z-value  P(>|z|)
# .sp_adltban ~~
#    .sp_kidsban        2.784    0.195   14.300    0.000
#
# Intercepts:
#                    Estimate  Std.Err  z-value  P(>|z|)
#   .numcg     (u0)   18.485    0.566   32.668    0.000
#   .sp_adltbn (u1)    4.221    0.167   25.281    0.000
#   .sp_kidsbn (u2)    7.926    0.143   55.272    0.000
#
# Variances:
#                    Estimate  Std.Err  z-value  P(>|z|)
#   .numcg            54.283    1.716   31.628    0.000
#   .sp_adltban       11.011    0.239   46.140    0.000
#   .sp_kidsban        9.402    0.209   44.998    0.000
#
# Defined Parameters:
#                    Estimate  Std.Err  z-value  P(>|z|)
#    a1b1             -0.017    0.006   -2.905    0.004
#    a2b2             -0.007    0.006   -1.234    0.217
#    total            -0.125    0.040   -3.169    0.002
## End(No test)




