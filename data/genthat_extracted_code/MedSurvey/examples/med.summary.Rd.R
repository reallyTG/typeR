library(MedSurvey)


### Name: med.summary
### Title: To print the summary results of the mediation analysis
### Aliases: med.summary

### ** Examples

## Don't show: 
 #Toy example for check:
R <- 20
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
fit.BRR2 <- med.fit.BRR(model=model2, data=MedData, mwgtname=mwgtname,
             repwgtnames=repwgtnames)
med.summary(fit=fit.BRR2, med.eff=c('a1b1' , 'a2b2'))
## End(Don't show)
## No test: 
R <- 160
wgtnames <- paste("repwgt", seq(0,R,by=1), sep="")
mwgtname=wgtnames[1]
repwgtnames=wgtnames[2:(R+1)]
fayfactor=0.5

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
fit.BRR2 <- med.fit.BRR(model=model2, data=MedData, mwgtname=mwgtname,
             repwgtnames=repwgtnames, fayfactor)
temp <- med.summary(fit=fit.BRR2, med.eff=c('a1b1' , 'a2b2'))
#
# MedSurvey 1.0
#
# Multimediation with Complex Survey Data:
#
#   Effect             Est.          BRR SE.          p Value      adj.p Value
#
#   a1b1     -0.017475544      0.006014820      0.003667674      0.007335347
#   a2b2     -0.007244189      0.005870823      0.217228711      0.217228711
#
# NOTE:
#   p Value adjustment method is holm
#   Standard errors type is BRR SE.
#
#
######################################
# To catch the unformatted results:
temp
#
# $med.label
# [1] "a1b1" "a2b2"
#
# $med.est
# [1] -0.017475544 -0.007244189
#
# $med.se
# [1] 0.006014820 0.005870823
#
# $org.p.value
# [1] 0.003667674 0.217228711
#
# $adj.p.value
# [1] 0.007335347 0.217228711
#
# $se.type
# [1] "BRR SE."
#
# $p.adj.method
# [1] "holm"
#
## End(No test)




