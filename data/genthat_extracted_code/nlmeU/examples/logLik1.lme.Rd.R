library(nlmeU)


### Name: logLik1.lme
### Title: Calculates contribution of one subject to the log-likelihood for
###   'lme' object
### Aliases: logLik1.lme

### ** Examples

require(nlme)
lm3.form <- visual ~ visual0 + time + treat.f
(fm16.5ml <-                                # M16.5
   lme(lm3.form,
   random = list(subject = pdDiag(~time)),
   weights = varPower(form = ~time),
   data = armd, method = "ML"))
 df1 <- subset(armd, subject == "1")       # Panel R20.7
 logLik1(fm16.5ml, df1)



