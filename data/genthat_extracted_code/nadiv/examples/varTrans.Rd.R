library(nadiv)


### Name: varTrans
### Title: Transforms ASReml-R gamma sampling variances to component scale
### Aliases: varTrans

### ** Examples


  ## Not run: 
##D     library(asreml)
##D     ginvA <- asreml.Ainverse(warcolak)$ginv
##D     ginvD <- makeD(warcolak[,1:3])$listDinv
##D     warcolak$IDD <- warcolak$ID
##D     warcolak.mod <- asreml(trait1 ~ sex, random = ~ ped(ID) + giv(IDD), 
##D 	ginverse = list(ID = ginvA, IDD = ginvD), data = warcolak) 
##D     summary(warcolak.mod)$varcomp
##D     sqrt(varTrans(warcolak.mod))  # sqrt() so can compare with standard errors from summary
##D    
## End(Not run)




