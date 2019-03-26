library(ordPens)


### Name: ordGene
### Title: Testing for differentially expressed genes
### Aliases: ordGene
### Keywords: anova gene expression

### ** Examples

## Not run: 
##D # use dopamine data from package IsoGene
##D require(IsoGene)
##D require(Biobase)
##D data(dopamine)
##D xpr <- data.frame(exprs(dopamine))
##D dose <- unlist(pData(dopamine))
##D plot(dose,xpr[83,], col=as.factor(dose), lwd=2, ylab="expression")
##D 
##D # calculate p-values
##D pvals <- ordGene(xpr = xpr, lvs = dose, nsim=1e6)
##D 
##D # compare distribution of (small) p-values
##D plot(ecdf(pvals[,1]), xlim=c(0,0.05), ylim=c(0,0.12),
##D main="dopamine", xlab="p-value", ylab="F(p-value)")
##D plot(ecdf(pvals[,2]), xlim=c(0,0.05), add=TRUE, col=2)
##D plot(ecdf(pvals[,3]), xlim=c(0,0.05), add=TRUE, col=3)
##D legend('topleft', colnames(pvals), col=1:3, lwd=2, lty=1)
## End(Not run)



