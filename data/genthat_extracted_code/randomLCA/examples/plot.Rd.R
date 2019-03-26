library(randomLCA)


### Name: plot
### Title: Plot a randomLCA object
### Aliases: plot.randomLCA
### Keywords: methods

### ** Examples

## Not run: 
##D # standard latent class with 2 classes
##D uterinecarcinoma.lca2 <- randomLCA(uterinecarcinoma[,1:7],freq=uterinecarcinoma$freq)
##D plot(uterinecarcinoma.lca2)
##D uterinecarcinoma.lcarandom2 <- randomLCA(uterinecarcinoma[,1:7],
##D   freq=uterinecarcinoma$freq,random=TRUE,probit=TRUE,quadpoints=61)
##D # default for random effects models is marginal
##D plot(uterinecarcinoma.lcarandom2)
##D # default for random effects models conditional is p=0.5 i.e. median
##D plot(uterinecarcinoma.lcarandom2,graphtype="conditional")
##D # look at variability by plotting conditional probabilities at 0.05,0.5 and 0.95
##D plot(uterinecarcinoma.lcarandom2,graphtype="conditional",conditionalp=c(0.05,0.5,0.95))
## End(Not run)



