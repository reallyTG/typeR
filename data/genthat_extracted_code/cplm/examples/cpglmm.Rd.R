library(cplm)


### Name: cpglmm
### Title: Compound Poisson Generalized Linear Mixed Models
### Aliases: cpglmm
### Keywords: models

### ** Examples

## Not run: 
##D # use Stock and Spacing as main effects and Plant as random effect
##D (f1 <- cpglmm(RLD ~ Stock + Spacing +  (1|Plant), data = FineRoot))
##D             
##D coef(f1); fixef(f1); ranef(f1)  #coefficients
##D VarCorr(f1)  #variance components
##D 
##D # add another random effect
##D (f2 <- update(f1, . ~ . + (1|Zone)))
##D # test the additional random effect
##D anova(f1,f2)
##D 
##D # try a different optimizer 
##D (f3 <- cpglmm(RLD ~  Stock + Spacing +  (1|Plant), 
##D             data = FineRoot, optimizer = "bobyqa", 
##D             control = list(trace = 2)))
##D 
##D # adaptive G-H quadrature  
##D (f4 <- cpglmm(RLD ~  Stock + Spacing +  (1|Plant), 
##D             data = FineRoot, nAGQ = 3))
##D 
##D # a model with smoothing effects
##D (f5 <- cpglmm(increLoss ~ tp(lag, k = 4) + (1|year) , 
##D             data = ClaimTriangle))
## End(Not run)



