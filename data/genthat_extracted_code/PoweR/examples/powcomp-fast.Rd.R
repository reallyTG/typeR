library(PoweR)


### Name: powcomp.fast
### Title: Computation of power and level tables for hypothesis tests.
### Aliases: powcomp.fast
### Keywords: datagen htest

### ** Examples

## Regenerate Table 6 from Puig (2000) (page 424)

law.index <- 1
# Take M = 50000 for accurate results 
M <- 10
vectn <- c(10,15,20,35,50,75,100)
level <- c(0.05)
stat.indices <- c(43,44,42,45,46)
law.indices <- c(2,3,4)
alter <- list(stat43 = 3,stat44 = 3,stat42 = 3,stat45 = 3,stat46 = 3)
critval <- many.crit(law.index,stat.indices,M,vectn,level,alter,
                     law.pars = NULL,parstats = NULL)
table6 <- powcomp.fast(law.indices,stat.indices,vectn,M,level,critval = critval,alter,
                       parlaws = NULL,parstats = NULL,nbclus = 1)
table6



