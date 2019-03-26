library(survival)


### Name: aareg
### Title: Aalen's additive regression model for censored data
### Aliases: aareg
### Keywords: survival

### ** Examples

# Fit a model to the lung cancer data set
lfit <- aareg(Surv(time, status) ~ age + sex + ph.ecog, data=lung,
                     nmin=1)
## Not run: 
##D lfit
##D Call:
##D aareg(formula = Surv(time, status) ~ age + sex + ph.ecog, data = lung, nmin = 1
##D         )
##D 
##D   n=227 (1 observations deleted due to missing values)
##D     138 out of 138 unique event times used
##D 
##D               slope      coef se(coef)     z        p 
##D Intercept  5.26e-03  5.99e-03 4.74e-03  1.26 0.207000
##D       age  4.26e-05  7.02e-05 7.23e-05  0.97 0.332000
##D       sex -3.29e-03 -4.02e-03 1.22e-03 -3.30 0.000976
##D   ph.ecog  3.14e-03  3.80e-03 1.03e-03  3.70 0.000214
##D 
##D Chisq=26.73 on 3 df, p=6.7e-06; test weights=aalen
##D 
##D plot(lfit[4], ylim=c(-4,4))  # Draw a plot of the function for ph.ecog
## End(Not run)
lfit2 <- aareg(Surv(time, status) ~ age + sex + ph.ecog, data=lung,
                  nmin=1, taper=1:10)
## Not run: lines(lfit2[4], col=2)  # Nearly the same, until the last point

# A fit to the mulitple-infection data set of children with
# Chronic Granuomatous Disease.  See section 8.5 of Therneau and Grambsch.
fita2 <- aareg(Surv(tstart, tstop, status) ~ treat + age + inherit +
                         steroids + cluster(id), data=cgd)
## Not run: 
##D   n= 203 
##D     69 out of 70 unique event times used
##D 
##D                      slope      coef se(coef) robust se     z        p
##D Intercept         0.004670  0.017800 0.002780  0.003910  4.55 5.30e-06
##D treatrIFN-g      -0.002520 -0.010100 0.002290  0.003020 -3.36 7.87e-04
##D age              -0.000101 -0.000317 0.000115  0.000117 -2.70 6.84e-03
##D inheritautosomal  0.001330  0.003830 0.002800  0.002420  1.58 1.14e-01
##D steroids          0.004620  0.013200 0.010600  0.009700  1.36 1.73e-01
##D 
##D Chisq=16.74 on 4 df, p=0.0022; test weights=aalen
## End(Not run)



