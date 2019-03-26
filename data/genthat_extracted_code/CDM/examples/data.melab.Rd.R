library(CDM)


### Name: data.melab
### Title: MELAB Data (Li, 2011)
### Aliases: data.melab
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.melab, package="CDM")
##D 
##D data <- data.melab$data
##D q.matrix <- data.melab$q.matrix
##D 
##D #*** Model 1: Reduced RUM model
##D mod1 <- CDM::gdina( data, q.matrix, rule="RRUM" )
##D summary(mod1)
##D 
##D #*** Model 2: GDINA model
##D mod2 <- CDM::gdina( data, q.matrix, rule="GDINA" )
##D summary(mod2)
##D 
##D #*** Model 3: DINA model
##D mod3 <- CDM::gdina( data, q.matrix, rule="DINA" )
##D summary(mod3)
##D 
##D #*** Model 4: 2PL model
##D mod4 <- CDM::gdm( data, theta.k=seq(-6,6,len=21), center )
##D summary(mod4)
##D 
##D #----
##D # Model comparisons
##D 
##D #*** RRUM vs. GDINA
##D anova(mod1,mod2)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df       p
##D   ##   1 Model 1 -20252.74 40505.48    69 40643.48 41030.60 30.88801 18 0.02966
##D   ##   2 Model 2 -20237.30 40474.59    87 40648.59 41136.69       NA NA      NA
##D 
##D   ##  -> GDINA is not superior to RRUM (according to AIC and BIC)
##D 
##D #*** DINA vs. RRUM
##D anova(mod1,mod3)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   2 Model 2 -20332.52 40665.04    55 40775.04 41083.61 159.5566 14  0
##D   ##   1 Model 1 -20252.74 40505.48    69 40643.48 41030.60       NA NA NA
##D 
##D   ##  -> RRUM fits the data significantly better than the DINA model
##D 
##D #*** RRUM vs. 2PL (use only AIC and BIC for comparison)
##D anova(mod1,mod4)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   2 Model 2 -20390.19 40780.38    43 40866.38 41107.62 274.8962 26  0
##D   ##   1 Model 1 -20252.74 40505.48    69 40643.48 41030.60       NA NA NA
##D 
##D   ## -> RRUM fits the data better than 2PL
##D 
##D #----
##D # Model fit statistics
##D 
##D # RRUM
##D fmod1 <- CDM::modelfit.cor.din( mod1, jkunits=0)
##D summary(fmod1)
##D   ##   Test of Global Model Fit
##D   ##          type    value       p
##D   ##   1   max(X2) 10.10408 0.28109
##D   ##   2 abs(fcor)  0.06726 0.24023
##D   ##
##D   ##   Fit Statistics
##D   ##                       est
##D   ##   MADcor          0.01708
##D   ##   SRMSR           0.02158
##D   ##   MX2             0.96590
##D   ##   100*MADRESIDCOV 0.27269
##D   ##   MADQ3           0.02781
##D 
##D   ##  -> not a significant misfit of the RRUM model
##D 
##D # GDINA
##D fmod2 <- CDM::modelfit.cor.din( mod2, jkunits=0)
##D summary(fmod2)
##D   ##   Test of Global Model Fit
##D   ##          type    value       p
##D   ##   1   max(X2) 10.40294 0.23905
##D   ##   2 abs(fcor)  0.06817 0.20964
##D   ##
##D   ##   Fit Statistics
##D   ##                       est
##D   ##   MADcor          0.01703
##D   ##   SRMSR           0.02151
##D   ##   MX2             0.94468
##D   ##   100*MADRESIDCOV 0.27105
##D   ##   MADQ3           0.02713
## End(Not run)



