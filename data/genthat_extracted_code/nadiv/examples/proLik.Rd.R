library(nadiv)


### Name: proLik
### Title: Profile Likelihoods
### Aliases: proLik is.proLik plot.proLik is.proLik plot.proLik

### ** Examples


  ## Not run: 
##D     library(asreml)
##D     ginvA <- asreml.Ainverse(warcolak[, c(1,3,2)])$ginv
##D     ginvD <- makeD(warcolak[,1:3])$listDinv
##D     warcolak$IDD <- warcolak$ID
##D     warcolak.mod <- asreml(trait1 ~ sex, random = ~ ped(ID) + giv(IDD), 
##D 	ginverse = list(ID = ginvA, IDD = ginvD), rcov = ~ idv(units), data = warcolak) 
##D     summary(warcolak.mod)$varcomp
##D     profileA <- proLik(full.model = warcolak.mod, component = "ped(ID)!ped", 
##D         G = TRUE, negative = FALSE, nsample.units = 3, nse = 3)
##D     profileA
##D     profileD <- proLik(warcolak.mod, component = "giv(IDD).giv", 
##D 	G = TRUE, negative = FALSE, nsample.units = 3, nse = 3)
##D     profileE <- proLik(warcolak.mod, component = "R!units.var", G = FALSE, negative = FALSE)
##D 
##D     x11(w = 6, h = 8)
##D     par(mfrow = c(3,1))
##D       plot(profileA) 
##D       plot(profileD)
##D       plot(profileE)
##D    
## End(Not run)





