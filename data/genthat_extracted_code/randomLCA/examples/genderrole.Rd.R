library(randomLCA)


### Name: genderrole
### Title: Gender Role Opinion Items
### Aliases: genderrole
### Keywords: datasets

### ** Examples

## Not run: 
##D # standard latent class
##D genderrole.lca1 <- randomLCA(genderrole[,1:5],freq=genderrole$Freq,nclass=1)
##D genderrole.lca2 <- randomLCA(genderrole[,1:5],freq=genderrole$Freq)
##D genderrole.lca3 <- randomLCA(genderrole[,1:5],freq=genderrole$Freq,nclass=3)
##D # repeat with random effect with constant loading
##D # increase quadrature points and/or use higher penalty to obtain
##D # convergence
##D genderrole.lca1random <- randomLCA(genderrole[,1:5],freq=genderrole$Freq,
##D 	nclass=1,random=TRUE)
##D genderrole.lca2random <- randomLCA(genderrole[,1:5],freq=genderrole$Freq,
##D 	random=TRUE,penalty=0.1,quadpoints=61)
##D genderrole.lca3random <- randomLCA(genderrole[,1:5],freq=genderrole$Freq,
##D 	nclass=3,random=TRUE,penalty=0.1,quadpoints=61)
##D # improved BIC for 1 class random
##D print(c(BIC(genderrole.lca1),BIC(genderrole.lca2),BIC(genderrole.lca3)))
##D print(c(BIC(genderrole.lca1random),BIC(genderrole.lca2random),
##D 	BIC(genderrole.lca3random)))
##D # can also repeat fits without constant loading to give mixture of IRT models
##D genderrole.lca1random2 <- randomLCA(genderrole[,1:5],freq=genderrole$Freq,
##D 	nclass=1,random=TRUE,constload=FALSE)
##D genderrole.lca2random2 <- randomLCA(genderrole[,1:5],freq=genderrole$Freq,
##D 	random=TRUE,constload=FALSE,quadpoints=61,penalty=0.1)
##D genderrole.lca3random2 <- randomLCA(genderrole[,1:5],freq=genderrole$Freq,
##D 	nclass=3,random=TRUE,constload=FALSE,quadpoints=61,penalty=0.1)
##D # no improvement in fit
##D print(c(BIC(genderrole.lca1random2),BIC(genderrole.lca2random2),
##D 	BIC(genderrole.lca3random2)))
## End(Not run)



