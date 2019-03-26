library(CDM)


### Name: anova
### Title: Likelihood Ratio Test for Model Comparisons
### Aliases: anova.din anova.gdina anova.mcdina anova.gdm anova.slca
###   anova.reglca
### Keywords: Likelihood ratio test anova

### ** Examples

#############################################################################
# EXAMPLE 1: anova with din objects
#############################################################################

# Model 1
d1 <- CDM::din(sim.dina, q.matr=sim.qmatrix )
# Model 2 with equal guessing and slipping parameters
d2 <- CDM::din(sim.dina, q.matr=sim.qmatrix, guess.equal=TRUE, slip.equal=TRUE)
# model comparison
anova(d1,d2)
  ##     Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
  ##   2    d2 -2176.482 4352.963     9 4370.963 4406.886 268.2071 16  0
  ##   1    d1 -2042.378 4084.756    25 4134.756 4234.543       NA NA NA

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: anova with gdina objects
##D #############################################################################
##D 
##D # Model 3: GDINA model
##D d3 <- CDM::gdina( sim.dina, q.matr=sim.qmatrix )
##D 
##D # Model 4: DINA model
##D d4 <- CDM::gdina( sim.dina, q.matr=sim.qmatrix, rule="DINA")
##D 
##D # model comparison
##D anova(d3,d4)
##D   ##     Model   loglike Deviance Npars      AIC      BIC    Chisq df       p
##D   ##   2    d4 -2042.293 4084.586    25 4134.586 4234.373 31.31995 16 0.01224
##D   ##   1    d3 -2026.633 4053.267    41 4135.266 4298.917       NA NA      NA
## End(Not run)



