library(adegenet)


### Name: hybridize
### Title: Function hybridize takes two genind in inputs and generates
###   hybrids individuals having one parent in both objects.
### Aliases: hybridize

### ** Examples

## Not run: 
##D ## Let's make some cattle hybrids
##D data(microbov)
##D 
##D ## first, isolate each breed
##D temp <- seppop(microbov)
##D names(temp)
##D salers <- temp$Salers
##D zebu <- temp$Zebu
##D 
##D ## let's make some... Zeblers
##D zebler <- hybridize(salers, zebu, n=40,
##D                     pop="Zebler")
##D 
##D 
##D ## now let's merge all data into a single genind
##D newDat <- repool(microbov, zebler)
##D 
##D ## make a correspondance analysis
##D ## and see where hybrids are placed
##D X <- genind2genpop(newDat, quiet=TRUE)
##D coa1 <- dudi.coa(tab(X),scannf=FALSE,nf=3)
##D s.label(coa1$li)
##D add.scatter.eig(coa1$eig,2,1,2)
##D 
## End(Not run)





