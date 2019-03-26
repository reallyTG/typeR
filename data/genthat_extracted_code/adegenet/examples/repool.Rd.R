library(adegenet)


### Name: repool
### Title: Pool several genotypes into a single dataset
### Aliases: repool

### ** Examples

## Not run: 
##D ## use the cattle breeds dataset
##D data(microbov)
##D temp <- seppop(microbov)
##D names(temp)
##D ## hybridize salers and zebu -- nasty cattle
##D zebler <- hybridize(temp$Salers, temp$Zebu, n=40)
##D zebler
##D ## now merge zebler with other cattle breeds
##D nastyCattle <- repool(microbov, zebler)
##D nastyCattle
## End(Not run)




