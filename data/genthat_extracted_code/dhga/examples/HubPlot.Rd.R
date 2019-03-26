library(dhga)


### Name: HubPlot
### Title: Venn plot of hub genes under two conditions namely stress and
###   control
### Aliases: HubPlot
### Keywords: gene co-expression network hub gene venn plot level of
###   significance

### ** Examples

data(rice_salt)
pval.stres <- pvalue.hub(rice_salt, beta=6, m=18, s=80, plot=FALSE)
pvalue.stress <- pval.stres[, 2]

data(rice_normal)
pval.control <- pvalue.hub(rice_normal, beta=6, m=18, s=80, plot=FALSE)
pvalue.control <- pval.control[, 2]
HubPlot(pvalue.stress, pvalue.control, alpha=0.0001)



