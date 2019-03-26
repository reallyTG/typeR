library(GB2)


### Name: CompoundAuxVarest
### Title: Variance Estimation under the Compound GB2 Distribution Using
###   Auxiliary Information
### Aliases: CompoundAuxVarest scoreU.cavgb2 scorez.cavgb2 varscore.cavgb2
###   desvar.cavgb2 hess.cavgb2 vepar.cavgb2 veind.cavgb2
### Keywords: distribution

### ** Examples

## Not run: 
##D # Example (following of example in CompoundAuxFit)
##D 
##D # Scores U 
##D U <- scoreU.cavgb2(facgl, z, lambdafitl)
##D 
##D # Scores multiplied by z
##D SC <- scorez.cavgb2(U,z)
##D 
##D # Naive variance estimate of sum of scores
##D (Vsc <- varscore.cavgb2(SC,w=pwa))
##D 
##D # Design based variance of sum of scores
##D (desv <- desvar.cavgb2(data=ns,SC=SC,id=~hid,strata=~region,weights=~pwa))
##D 
##D # Hessian
##D hess <- hess.cavgb2(U,pglfitl,z,w=pwa) 
##D 
##D # 1. Sandwich variance-covariance matrix estimate of parameters using Vsc:
##D Param1 <- vepar.cavgb2(fitcml,Vsc, hess)
##D Param1
##D 
##D # 2. Sandwich variance-covariance matrix estimate of parameters using 
##D # the design variance:
##D Param2 <- vepar.cavgb2(fitcml,desv$Vtheta, hess)
##D Param2 
##D 
##D # 3. Indicators and conditional variances : takes a long time!
##D (Indic <- veind.cavgb2(group,Param2 ,agl.fit,bgl.fit,pgl.fit,qgl.fit, 
##D                        pl0, pglfitl, decomp="l") )
## End(Not run)



