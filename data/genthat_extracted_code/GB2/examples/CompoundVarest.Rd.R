library(GB2)


### Name: CompoundVarest
### Title: Variance Estimation of the Compound GB2 Distribution
### Aliases: CompoundVarest scoreU.cgb2 varscore.cgb2 desvar.cgb2 hess.cgb2
###   vepar.cgb2 derivind.cgb2 veind.cgb2
### Keywords: distribution

### ** Examples

## Not run: 
##D # Example (following of example in CompoundFit)
##D 
##D # Estimated mixture probabilities:
##D (pl.hat <- estim[[1]])
##D 
##D # scores per unit
##D U <- scoreU.cgb2(fac, pl.hat)  
##D 
##D # Conditional variances given a,b,p,q:
##D 
##D # 1. Variance of sum of scores:
##D (Vsc <- t(U) ##D 
##D (Vsc <- varscore.cgb2(U))        
##D 
##D # 2. sandwich variance-covariance matrix estimate of (v_1,v_2):
##D (hess <-  hess.cgb2(U,pl.hat))
##D (Parameters <- vepar.cgb2(estim, Vsc, hess))
##D 
##D # 3. Theoretical indicators  (with mixture prob pl)
##D decomp <- "r"
##D (theoretical <- main.cgb2( 0.6,a,b,p,q,pl0, pl,decomp=decomp))
##D 
##D # Estimated indicators and conditional variances : takes a long time!
##D (Indic <- veind.cgb2(Parameters,a,b,p,q, pl0, pl.hat, decomp="r") )
##D 
## End(Not run)



