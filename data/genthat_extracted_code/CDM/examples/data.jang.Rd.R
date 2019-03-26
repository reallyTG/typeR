library(CDM)


### Name: data.jang
### Title: Dataset Jang (2009)
### Aliases: data.jang
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.jang, package="CDM")
##D 
##D data <- data.jang$data
##D q.matrix <- data.jang$q.matrix
##D 
##D #*** Model 1: Reduced RUM model
##D mod1 <- CDM::gdina( data, q.matrix, rule="RRUM", conv.crit=.001, increment.factor=1.025 )
##D summary(mod1)
##D 
##D #*** Model 2: Additive model (identity link)
##D mod2 <- CDM::gdina( data, q.matrix, rule="ACDM", conv.crit=.001, linkfct="identity" )
##D summary(mod2)
##D 
##D #*** Model 3: DINA model
##D mod3 <- CDM::gdina( data, q.matrix, rule="DINA", conv.crit=.001 )
##D summary(mod3)
##D 
##D anova(mod1,mod2)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   1 Model 1 -30315.03 60630.06   153 60936.06 61748.98 88.29627  0  0
##D   ##   2 Model 2 -30270.88 60541.76   153 60847.76 61660.68       NA NA NA
##D anova(mod1,mod3)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   2 Model 2 -30373.99 60747.97   129 61005.97 61691.38 117.9128 24  0
##D   ##   1 Model 1 -30315.03 60630.06   153 60936.06 61748.98       NA NA NA
##D 
##D # RRUM
##D summary( CDM::modelfit.cor.din( mod1, jkunits=0) )
##D   ##          type    value       p
##D   ##   1   max(X2) 11.79073 0.39645
##D   ##   2 abs(fcor)  0.09541 0.07422
##D   ##                       est
##D   ##   MADcor          0.01834
##D   ##   SRMSR           0.02300
##D   ##   MX2             0.86718
##D   ##   100*MADRESIDCOV 0.38690
##D   ##   MADQ3           0.02413
##D 
##D # additive model (identity)
##D summary( CDM::modelfit.cor.din( mod2, jkunits=0) )
##D   ##          type   value       p
##D   ##   1   max(X2) 9.78958 1.00000
##D   ##   2 abs(fcor) 0.08770 0.22993
##D   ##                       est
##D   ##   MADcor          0.01721
##D   ##   SRMSR           0.02158
##D   ##   MX2             0.69163
##D   ##   100*MADRESIDCOV 0.36343
##D   ##   MADQ3           0.02423
##D 
##D # DINA model
##D summary( CDM::modelfit.cor.din( mod3, jkunits=0) )
##D   ##          type    value       p
##D   ##   1   max(X2) 13.48449 0.16020
##D   ##   2 abs(fcor)  0.10651 0.01256
##D   ##                       est
##D   ##   MADcor          0.01999
##D   ##   SRMSR           0.02495
##D   ##   MX2             0.92820
##D   ##   100*MADRESIDCOV 0.42226
##D   ##   MADQ3           0.02258
## End(Not run)



