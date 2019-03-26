library(OrgMassSpecR)


### Name: IsotopicDistributionN
### Title: Isotopic Distribution of a Nitrogen-15 Labeled Peptide.
### Aliases: IsotopicDistributionN

### ** Examples

## simulate a peptide with 0.368 to 100 percent incorporation and plot
dn <- IsotopicDistributionN("NECFLQHK", incorp = 0.00368)
dn$t <- "incorp = 0.368%"
d50 <- IsotopicDistributionN("NECFLQHK", incorp = 0.5)
d50$t <- "incorp = 50%"
d99 <- IsotopicDistributionN("NECFLQHK", incorp = 0.99)
d99$t <- "incorp = 99%"
x <- rbind(dn, d50, d99)
library(lattice)
xyplot(percent ~ mz | t, data = x,
    type = "h", 
    xlab = "m/z", 
    ylab = "intensity (%)",
    main = "Isotopic distribution of peptide NECFLQHK with 
            varying nitrogen-15 incorporation")
## Not run: 
##D          
##D ## simulate peptide DVFLGMFLYPYAR with oxidized methionine
##D IsotopicDistributionN("DVFLGmFLYPYAR", incorp = 0.5, 
##D                       custom = list(code = "m", 
##D                                     elements = c(C=5, H=9, N=1, O=2, S=1)))
## End(Not run)





