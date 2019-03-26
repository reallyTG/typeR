library(survival)


### Name: summary.aareg
### Title: Summarize an aareg fit
### Aliases: summary.aareg
### Keywords: survival

### ** Examples

afit <- aareg(Surv(time, status) ~ age + sex + ph.ecog, data=lung,
     dfbeta=TRUE)
summary(afit)
## Not run: 
##D               slope   test se(test) robust se     z        p 
##D Intercept  5.05e-03    1.9     1.54      1.55  1.23 0.219000
##D       age  4.01e-05  108.0   109.00    106.00  1.02 0.307000
##D       sex -3.16e-03  -19.5     5.90      5.95 -3.28 0.001030
##D   ph.ecog  3.01e-03   33.2     9.18      9.17  3.62 0.000299
##D 
##D Chisq=22.84 on 3 df, p=4.4e-05; test weights=aalen
## End(Not run)

summary(afit, maxtime=600)
## Not run: 
##D               slope   test se(test) robust se      z        p 
##D Intercept  4.16e-03   2.13     1.48      1.47  1.450 0.146000
##D       age  2.82e-05  85.80   106.00    100.00  0.857 0.392000
##D       sex -2.54e-03 -20.60     5.61      5.63 -3.660 0.000256
##D   ph.ecog  2.47e-03  31.60     8.91      8.67  3.640 0.000271
##D 
##D Chisq=27.08 on 3 df, p=5.7e-06; test weights=aalen
## End(Not run)


