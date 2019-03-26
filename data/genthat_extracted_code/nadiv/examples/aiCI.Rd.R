library(nadiv)


### Name: aiCI
### Title: Confidence Intervals for Variance Components
### Aliases: aiCI

### ** Examples


  ## Not run: 
##D     library(asreml)
##D     ginvA <- asreml.Ainverse(warcolak)$ginv
##D     ginvD <- makeD(warcolak[,1:3])$listDinv
##D     warcolak$IDD <- warcolak$ID
##D     warcolak.mod <- asreml(trait1 ~ sex, random = ~ped(ID) + giv(IDD), 
##D 	ginverse = list(ID = ginvA, IDD = ginvD), data = warcolak) 
##D     summary(warcolak.mod)$varcomp
##D     aiCI(warcolak.mod)    
##D    
## End(Not run)




