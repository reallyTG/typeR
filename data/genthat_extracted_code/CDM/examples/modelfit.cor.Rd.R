library(CDM)


### Name: modelfit.cor
### Title: Assessing Model Fit and Local Dependence by Comparing Observed
###   and Expected Item Pair Correlations
### Aliases: modelfit.cor modelfit.cor2 modelfit.cor.din
###   summary.modelfit.cor.din
### Keywords: Model fit Local dependence summary

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Model fit for sim.dina
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D dat <- sim.dina
##D q.matrix <- sim.qmatrix
##D 
##D #*** Model 1: DINA model for DINA simulated data
##D mod1 <- CDM::din(dat, q.matrix=q.matrix, rule="DINA" )
##D fmod1 <- CDM::modelfit.cor.din(mod1, jkunits=10)
##D summary(fmod1)
##D   ##   Test of Global Model Fit
##D   ##          type value     p
##D   ##   1   max(X2) 8.728 0.113
##D   ##   2 abs(fcor) 0.143 0.080
##D   ##
##D   ##   Fit Statistics
##D   ##                     est jkunits jk_est jk_se est_low est_upp
##D   ##   MADcor          0.030      10  0.020 0.005   0.010   0.030
##D   ##   SRMSR           0.040      10  0.023 0.006   0.011   0.035
##D   ##   100*MADRESIDCOV 0.671      10  0.445 0.125   0.200   0.690
##D   ##   MADQ3           0.062      10  0.037 0.008   0.021   0.052
##D   ##   MADaQ3          0.059      10  0.034 0.008   0.019   0.050
##D 
##D # look at first five item pairs with highest degree of local dependence
##D itempairs <- fmod1$itempairs
##D itempairs <- itempairs[ order( itempairs$X2, decreasing=TRUE ), ]
##D itempairs[ 1:5, c("item1","item2", "X2", "X2_p", "X2_p.holm", "Q3") ]
##D   ##      item1 item2       X2        X2_p X2_p.holm          Q3
##D   ##   29 Item5 Item8 8.728248 0.003133174 0.1127943 -0.26616414
##D   ##   32 Item6 Item8 2.644912 0.103881881 1.0000000  0.04873154
##D   ##   21 Item3 Item9 2.195011 0.138458201 1.0000000  0.05948456
##D   ##   10 Item2 Item4 1.449106 0.228671389 1.0000000 -0.08036216
##D   ##   30 Item5 Item9 1.393583 0.237800911 1.0000000 -0.01934420
##D 
##D #*** Model 2: DINO model for DINA simulated data
##D mod2 <- CDM::din(dat, q.matrix=q.matrix, rule="DINO" )
##D fmod2 <- CDM::modelfit.cor.din(mod2, jkunits=10 )   # 10 jackknife units
##D summary(fmod2)
##D   ##   Test of Global Model Fit
##D   ##          type  value     p
##D   ##   1   max(X2) 13.139 0.010
##D   ##   2 abs(fcor)  0.199 0.001
##D   ##
##D   ##   Fit Statistics
##D   ##                     est jkunits jk_est jk_se est_low est_upp
##D   ##   MADcor          0.056      10  0.041 0.007   0.026   0.055
##D   ##   SRMSR           0.072      10  0.045 0.019   0.007   0.083
##D   ##   100*MADRESIDCOV 1.225      10  0.878 0.183   0.519   1.236
##D   ##   MADQ3           0.073      10  0.055 0.012   0.031   0.080
##D   ##   MADaQ3          0.073      10  0.066 0.012   0.042   0.089
##D 
##D #*** Model 3: estimate DINA model with gdina function
##D mod3 <- CDM::gdina( dat, q.matrix=q.matrix, rule="DINA" )
##D fmod3 <- CDM::modelfit.cor.din( mod3, jkunits=0 )  # no Jackknife estimation
##D summary(fmod3)
##D   ##   Test of Global Model Fit
##D   ##          type value     p
##D   ##   1   max(X2) 8.756 0.111
##D   ##   2 abs(fcor) 0.143 0.078
##D   ##
##D   ##   Fit Statistics
##D   ##                     est
##D   ##   MADcor          0.030
##D   ##   SRMSR           0.040
##D   ##   MX2             0.719
##D   ##   100*MADRESIDCOV 0.668
##D   ##   MADQ3           0.062
##D   ##   MADaQ3          0.059
##D 
##D #############################################################################
##D # EXAMPLE 2: Simulated Example DINA model
##D #############################################################################
##D 
##D set.seed(9765)
##D # specify Q-matrix
##D Q <- matrix( c(1,0, 0,1, 1,1 ), nrow=3, ncol=2, byrow=TRUE )
##D q.matrix <- Q[ rep(1:3,4), ]
##D I <- nrow(q.matrix)
##D 
##D # simulate data
##D guess <- stats::runif(I, 0, .3 )
##D slip <- stats::runif( I, 0, .4 )
##D N <- 150   # number of persons
##D dat <- CDM::sim.din( N=N, q.matrix=q.matrix, slip=slip, guess=guess )$dat
##D 
##D #*** estmate DINA model
##D mod1 <- CDM::din( dat, q.matrix=q.matrix, rule="DINA" )
##D fmod1 <- CDM::modelfit.cor.din(mod1, jkunits=10)
##D summary(fmod1)
##D   ##  Test of Global Model Fit
##D   ##         type  value     p
##D   ##  1   max(X2) 10.697 0.071
##D   ##  2 abs(fcor)  0.277 0.026
##D   ##
##D   ##  Fit Statistics
##D   ##                    est jkunits jk_est jk_se est_low est_upp
##D   ##  MADcor          0.052      10  0.026 0.010   0.006   0.045
##D   ##  SRMSR           0.074      10  0.048 0.013   0.022   0.074
##D   ##  100*MADRESIDCOV 1.259      10  0.646 0.213   0.228   1.063
##D   ##  MADQ3           0.080      10  0.047 0.010   0.027   0.068
##D   ##  MADaQ3          0.079      10  0.046 0.010   0.027   0.065
## End(Not run)



