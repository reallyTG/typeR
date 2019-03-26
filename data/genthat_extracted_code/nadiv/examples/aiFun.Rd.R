library(nadiv)


### Name: aiFun
### Title: Sampling (co)variances
### Aliases: aiFun

### ** Examples


  ## Not run: 
##D     library(asreml)
##D     ginvA <- asreml.Ainverse(warcolak)$ginv
##D     ginvD <- makeD(warcolak[,1:3])$listDinv
##D     warcolak$IDD <- warcolak$ID
##D     warcolak.mod <- asreml(trait1 ~ sex, random = ~ped(ID) + giv(IDD), 
##D 	ginverse = list(ID = ginvA, IDD = ginvD), data = warcolak) 
##D     summary(warcolak.mod)$varcomp
##D     aiFun(model = warcolak.mod, Dimnames = c("Va", "Vd", "Ve"), inverse = TRUE)    
##D    
## End(Not run)

  output <- c(7.3075921, 7.0635161, 12.3423380, 1.9539486, 2.7586340, 0.6626111)
  aiFun(AI.vec = output, inverse = FALSE, Dimnames = c("Va", "Vd", "Ve"))




