library(CDM)


### Name: data.dtmr
### Title: DTMR Fraction Data (Bradshaw et al., 2014)
### Aliases: data.dtmr
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.dtmr, package="CDM")
##D 
##D data <- data.dtmr$data
##D q.matrix <- data.dtmr$q.matrix
##D I <- ncol(data)
##D 
##D #*** Model 1: LCDM
##D # define item wise rules
##D rule <- rep( "ACDM", I )
##D names(rule) <- colnames(data)
##D rule[ c("M14","M17") ] <- "GDINA2"
##D # estimate model
##D mod1 <- CDM::gdina( data, q.matrix, linkfct="logit", rule=rule)
##D summary(mod1)
##D 
##D #*** Model 2: DINA model
##D mod2 <- CDM::gdina( data, q.matrix, rule="DINA" )
##D summary(mod2)
##D 
##D #*** Model 3: RRUM model
##D mod3 <- CDM::gdina( data, q.matrix, rule="RRUM" )
##D summary(mod3)
##D 
##D #--- model comparisons
##D 
##D # LCDM vs. DINA
##D anova(mod1,mod2)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   2 Model 2 -76570.89 153141.8    69 153279.8 153729.5 1726.645 10  0
##D   ##   1 Model 1 -75707.57 151415.1    79 151573.1 152088.0       NA NA NA
##D 
##D # LCDM vs. RRUM
##D anova(mod1,mod3)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   2 Model 2 -75746.13 151492.3    77 151646.3 152148.1 77.10994  2  0
##D   ##   1 Model 1 -75707.57 151415.1    79 151573.1 152088.0       NA NA NA
##D 
##D #--- model fit
##D summary( CDM::modelfit.cor.din( mod1 ) )
##D   ##   Test of Global Model Fit
##D   ##          type   value       p
##D   ##   1   max(X2) 7.74382 1.00000
##D   ##   2 abs(fcor) 0.04056 0.72707
##D   ##
##D   ##   Fit Statistics
##D   ##                       est
##D   ##   MADcor          0.00959
##D   ##   SRMSR           0.01217
##D   ##   MX2             0.75696
##D   ##   100*MADRESIDCOV 0.20283
##D   ##   MADQ3           0.02220
## End(Not run)



