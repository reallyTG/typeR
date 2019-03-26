library(ade4)


### Name: avimedi
### Title: Fauna Table for Constrained Ordinations
### Aliases: avimedi
### Keywords: datasets

### ** Examples

## Not run: 
##D data(avimedi)
##D coa1 <- dudi.coa(avimedi$fau, scan = FALSE, nf = 3)
##D bet1 <- bca(coa1, avimedi$plan$str, scan = FALSE)
##D wit1 <- wca(coa1, avimedi$plan$reg, scan=FALSE)
##D pcaiv1 <- pcaiv(coa1, avimedi$plan, scan = FALSE)
##D     
##D if(adegraphicsLoaded()) {
##D   g1 <- s.class(coa1$li, avimedi$plan$str:avimedi$plan$reg, 
##D     psub.text = "Correspondences Analysis", plot = FALSE)
##D   g2 <- s.class(bet1$ls, avimedi$plan$str, psub.text = "Between Analysis", plot = FALSE)
##D   g3 <- s.class(wit1$li, avimedi$plan$str, psub.text = "Within Analysis", plot = FALSE)
##D 
##D   g41 <- s.match(pcaiv1$li, pcaiv1$ls, plabels.cex = 0, 
##D     psub.text = "Canonical Correspondences Analysis", plot = FALSE)
##D   g42 <- s.class(pcaiv1$li, avimedi$plan$str:avimedi$plan$reg, plot = FALSE)
##D   g4 <- superpose(g41, g42, plot = FALSE)
##D   
##D   G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
##D 
##D } else {
##D   par(mfrow = c(2,2))
##D   s.class(coa1$li,avimedi$plan$str:avimedi$plan$reg,
##D       sub = "Correspondences Analysis")
##D   s.class(bet1$ls, avimedi$plan$str,
##D       sub = "Between Analysis")
##D   s.class(wit1$li, avimedi$plan$str,
##D       sub = "Within Analysis")
##D   s.match(pcaiv1$li, pcaiv1$ls, clab = 0,
##D       sub = "Canonical Correspondences Analysis")
##D   s.class(pcaiv1$li, avimedi$plan$str:avimedi$plan$reg, 
##D       add.plot = TRUE)
##D   par(mfrow=c(1,1))
##D }
## End(Not run)


