library(TAM)


### Name: anova-logLik
### Title: Likelihood Ratio Test for Model Comparisons and Log-Likelihood
###   Value
### Aliases: anova.tam anova.tam.mml anova.tam.mml.3pl anova.tamaan
###   anova.tam.latreg logLik.tam logLik.tam.mml logLik.tam.mml.3pl
###   logLik.tamaan logLik.tam.latreg
### Keywords: Likelihood ratio test anova logLik

### ** Examples

#############################################################################
# EXAMPLE 1: Dichotomous data sim.rasch - 1PL vs. 2PL model
#############################################################################

data(data.sim.rasch)
# 1PL estimation
mod1 <- TAM::tam.mml(resp=data.sim.rasch)
logLik(mod1)
# 2PL estimation
mod2 <- TAM::tam.mml.2pl(resp=data.sim.rasch, irtmodel="2PL")
logLik(mod2)
# Model comparison
anova( mod1, mod2 )
  ##     Model   loglike Deviance Npars      AIC      BIC    Chisq df       p
  ##   1  mod1 -42077.88 84155.77    41 84278.77 84467.40 54.05078 39 0.05508
  ##   2  mod2 -42050.86 84101.72    80 84341.72 84709.79       NA NA      NA

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Dataset reading (sirt package): 1- vs. 2-dimensional model
##D #############################################################################
##D 
##D data(data.read,package="sirt")
##D 
##D # 1-dimensional model
##D mod1 <- TAM::tam.mml.2pl(resp=data.read )
##D # 2-dimensional model
##D mod2 <- TAM::tam.fa(resp=data.read, irtmodel="efa", nfactors=2,
##D              control=list(maxiter=150) )
##D # Model comparison
##D anova( mod1, mod2 )
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   1    mod1 -1954.888 3909.777    24 3957.777 4048.809 76.66491 11  0
##D   ##   2    mod2 -1916.556 3833.112    35 3903.112 4035.867       NA NA NA
## End(Not run)



