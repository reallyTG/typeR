library(copBasic)


### Name: rmseCOP
### Title: The Root Mean Square Error between a Fitted Copula and an
###   Empirical Copula
### Aliases: rmseCOP
### Keywords: copula (goodness-of-fit) copula (inference) inference
###   goodness-of-fit

### ** Examples

## Not run: 
##D S <- simCOP(80, cop=GHcop, para=5) # Simulate some probabilities, but we
##D # must then treat these as data and recompute empirical probabilities.
##D U <- lmomco::pp(S$U, sort=FALSE); V <- lmomco::pp(S$V, sort=FALSE)
##D # The parent distribution is Gumbel-Hougaard extreme value copula.
##D # But in practical application we do not know that but say we speculate that
##D # perhaps the Galambos extreme value might be the parent. Then maximum
##D # likelihood is used to fit the single parameter.
##D pGL <- mleCOP(U,V, cop=GLcop, interval=c(0,20))$par
##D 
##D rmses <- c(rmseCOP(U,V, cop=GLcop, para=pGL),
##D            rmseCOP(U,V, cop=P),
##D            rmseCOP(U,V, cop=PSP))
##D print(rmses) # We will see that the first RMSE is the smallest as the
##D # Galambos has the nearest overall behavior than the P and PSP copulas.
## End(Not run)



