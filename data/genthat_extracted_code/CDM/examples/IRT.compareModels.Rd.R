library(CDM)


### Name: IRT.compareModels
### Title: Comparisons of Several Models
### Aliases: IRT.compareModels summary.IRT.compareModels
### Keywords: Model comparison

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Model comparison sim.dina dataset
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D dat <- sim.dina
##D q.matrix <- sim.qmatrix
##D 
##D #*** Model 0: DINA model with equal guessing and slipping parameters
##D mod0 <- CDM::din( dat, q.matrix, guess.equal=TRUE, slip.equal=TRUE )
##D summary(mod0)
##D 
##D #*** Model 1: DINA model
##D mod1 <- CDM::din( dat, q.matrix )
##D summary(mod1)
##D 
##D #*** Model 2: DINO model
##D mod2 <- CDM::din( dat, q.matrix, rule="DINO")
##D summary(mod2)
##D 
##D #*** Model 3: Additive GDINA model
##D mod3 <- CDM::gdina( dat, q.matrix, rule="ACDM")
##D summary(mod3)
##D 
##D #*** Model 4: GDINA model
##D mod4 <- CDM::gdina( dat, q.matrix, rule="GDINA")
##D summary(mod4)
##D 
##D # model comparisons
##D res <- CDM::IRT.compareModels( mod0, mod1, mod2, mod3, mod4 )
##D res
##D   ##   > res
##D   ##   $IC
##D   ##     Model   loglike Deviance Npars Nobs      AIC      BIC     AIC3     AICc     CAIC
##D   ##   1  mod0 -2176.482 4352.963     9  400 4370.963 4406.886 4379.963 4371.425 4415.886
##D   ##   2  mod1 -2042.378 4084.756    25  400 4134.756 4234.543 4159.756 4138.232 4259.543
##D   ##   3  mod2 -2086.805 4173.610    25  400 4223.610 4323.396 4248.610 4227.086 4348.396
##D   ##   4  mod3 -2048.233 4096.466    32  400 4160.466 4288.193 4192.466 4166.221 4320.193
##D   ##   5  mod4 -2026.633 4053.266    41  400 4135.266 4298.917 4176.266 4144.887 4339.917
##D   ##
##D # -> The DINA model (mod1) performed best in terms of AIC.
##D   ##   $LRtest
##D   ##     Model1 Model2      Chi2 df            p
##D   ##   1   mod0   mod1 268.20713 16 0.000000e+00
##D   ##   2   mod0   mod2 179.35362 16 0.000000e+00
##D   ##   3   mod0   mod3 256.49745 23 0.000000e+00
##D   ##   4   mod0   mod4 299.69671 32 0.000000e+00
##D   ##   5   mod1   mod3 -11.70967  7 1.000000e+00
##D   ##   6   mod1   mod4  31.48959 16 1.164415e-02
##D   ##   7   mod2   mod3  77.14383  7 5.262457e-14
##D   ##   8   mod2   mod4 120.34309 16 0.000000e+00
##D   ##   9   mod3   mod4  43.19926  9 1.981445e-06
##D   ##
##D # -> The GDINA model (mod4) was superior to the other models in terms
##D #    of the likelihood ratio test.
##D 
##D # get an overview with summary
##D summary(res)
##D summary(res,extended=FALSE)
##D 
##D #*******************
##D # applying model comparison for objects of class IRT.modelfit
##D 
##D # compute model fit statistics
##D fmod0 <- CDM::IRT.modelfit(mod0)
##D fmod1 <- CDM::IRT.modelfit(mod1)
##D fmod4 <- CDM::IRT.modelfit(mod4)
##D 
##D # model comparison
##D res <- CDM::IRT.compareModels( fmod0, fmod1,  fmod4 )
##D res
##D   ##   $IC
##D   ##        Model   loglike Deviance Npars Nobs      AIC      BIC     AIC3
##D   ##   mod0  mod0 -2176.482 4352.963     9  400 4370.963 4406.886 4379.963
##D   ##   mod1  mod1 -2042.378 4084.756    25  400 4134.756 4234.543 4159.756
##D   ##   mod4  mod4 -2026.633 4053.266    41  400 4135.266 4298.917 4176.266
##D   ##            AICc     CAIC      maxX2   p_maxX2     MADcor      SRMSR
##D   ##   mod0 4371.425 4415.886 118.172707 0.0000000 0.09172287 0.10941300
##D   ##   mod1 4138.232 4259.543   8.728248 0.1127943 0.03025354 0.03979948
##D   ##   mod4 4144.887 4339.917   2.397241 1.0000000 0.02284029 0.02989669
##D   ##        X100.MADRESIDCOV      MADQ3     MADaQ3
##D   ##   mod0        1.9749936 0.08840892 0.08353917
##D   ##   mod1        0.6713952 0.06184332 0.05923058
##D   ##   mod4        0.5148707 0.07477337 0.07145600
##D   ##
##D   ##   $LRtest
##D   ##     Model1 Model2      Chi2 df          p
##D   ##   1   mod0   mod1 268.20713 16 0.00000000
##D   ##   2   mod0   mod4 299.69671 32 0.00000000
##D   ##   3   mod1   mod4  31.48959 16 0.01164415
## End(Not run)



