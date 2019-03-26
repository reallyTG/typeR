library(ade4)


### Name: randEH
### Title: Nee and May's random process
### Aliases: randEH
### Keywords: multivariate

### ** Examples

data(carni70)
carni70.phy <- newick2phylog(carni70$tre)
mean(randEH(carni70.phy, nbofsp = 7, nbrep = 1000)) 

## Not run: 
##D # the folowing instructions can last about 2 minutes.
##D data(carni70)
##D carni70.phy <- newick2phylog(carni70$tre)
##D percent <- c(0,0.04,0.07,seq(0.1,1,by=0.1)) 
##D pres <- round(percent*70) 
##D topt <- sapply(pres, function(i) optimEH(carni70.phy, nbofsp = i, give = FALSE)) 
##D topt <- topt / EH(carni70.phy) 
##D tsam <- sapply(pres, function(i) mean(randEH(carni70.phy, nbofsp = i, nbrep = 1000))) 
##D tsam <- tsam / EH(carni70.phy) 
##D plot(pres, topt, xlab = "nb of species saved", ylab = "Evolutionary history saved", type = "l") 
##D lines(pres, tsam)
## End(Not run)



