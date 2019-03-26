library(CDM)


### Name: data.hr
### Title: Dataset 'data.hr' (Ravand et al., 2013)
### Aliases: data.hr
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.hr, package="CDM")
##D 
##D dat <- data.hr$data
##D Q <- data.hr$q.matrix
##D 
##D #*************
##D # Model 1: DINA model
##D mod1 <- CDM::din( dat, q.matrix=Q )
##D summary(mod1)       # summary
##D 
##D # plot results
##D plot(mod1)
##D 
##D # inspect coefficients
##D coef(mod1)
##D 
##D # posterior distribution
##D posterior <- mod1$posterior
##D round( posterior[ 1:5, ], 4 )  # first 5 entries
##D 
##D # estimate class probabilities
##D mod1$attribute.patt
##D 
##D # individual classifications
##D mod1$pattern[1:5,]   # first 5 entries
##D 
##D #*************
##D # Model 2: GDINA model
##D mod2 <- CDM::gdina( dat, q.matrix=Q)
##D summary(mod2)
##D 
##D #*************
##D # Model 3: Reduced RUM model
##D mod3 <- CDM::gdina( dat, q.matrix=Q, rule="RRUM" )
##D summary(mod3)
##D 
##D #--------
##D # model comparisons
##D 
##D # DINA vs GDINA
##D anova( mod1, mod2 )
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   1 Model 1 -31391.27 62782.54   101 62984.54 63524.49 195.9099 20  0
##D   ##   2 Model 2 -31293.32 62586.63   121 62828.63 63475.50       NA NA NA
##D 
##D # RRUM vs. GDINA
##D anova( mod2, mod3 )
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   2 Model 2 -31356.22 62712.43   105 62922.43 63483.76 125.7924 16  0
##D   ##   1 Model 1 -31293.32 62586.64   121 62828.64 63475.50       NA NA NA
##D 
##D # DINA vs. RRUM
##D anova(mod1,mod3)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   1 Model 1 -31391.27 62782.54   101 62984.54 63524.49 70.11246  4  0
##D   ##   2 Model 2 -31356.22 62712.43   105 62922.43 63483.76       NA NA NA
##D 
##D #-------
##D # model fit
##D 
##D # DINA
##D fmod1 <- CDM::modelfit.cor.din( mod1, jkunits=0)
##D summary(fmod1)
##D   ##   Test of Global Model Fit
##D   ##          type    value       p
##D   ##   1   max(X2) 16.35495 0.03125
##D   ##   2 abs(fcor)  0.10341 0.01416
##D   ##
##D   ##   Fit Statistics
##D   ##                       est
##D   ##   MADcor          0.01911
##D   ##   SRMSR           0.02445
##D   ##   MX2             0.93157
##D   ##   100*MADRESIDCOV 0.39100
##D   ##   MADQ3           0.02373
##D 
##D # GDINA
##D fmod2 <- CDM::modelfit.cor.din( mod2, jkunits=0)
##D summary(fmod2)
##D   ##   Test of Global Model Fit
##D   ##          type   value p
##D   ##   1   max(X2) 7.73670 1
##D   ##   2 abs(fcor) 0.07215 1
##D   ##
##D   ##   Fit Statistics
##D   ##                       est
##D   ##   MADcor          0.01830
##D   ##   SRMSR           0.02300
##D   ##   MX2             0.82584
##D   ##   100*MADRESIDCOV 0.37390
##D   ##   MADQ3           0.02383
##D 
##D # RRUM
##D fmod3 <- CDM::modelfit.cor.din( mod3, jkunits=0)
##D summary(fmod3)
##D   ##   Test of Global Model Fit
##D   ##          type    value       p
##D   ##   1   max(X2) 15.49369 0.04925
##D   ##   2 abs(fcor)  0.10076 0.02201
##D   ##
##D   ##   Fit Statistics
##D   ##                       est
##D   ##   MADcor          0.01868
##D   ##   SRMSR           0.02374
##D   ##   MX2             0.87999
##D   ##   100*MADRESIDCOV 0.38409
##D   ##   MADQ3           0.02416
## End(Not run)



