library(dhga)


### Name: HubStatus
### Title: Hub status of the genes in a gene co-expression network
### Aliases: HubStatus
### Keywords: gene co-expression network hub gene hub status level of
###   significance

### ** Examples

data(rice_salt)
pval.stres <- pvalue.hub(rice_salt, beta=6, m=18, s=80, plot=FALSE)
p1 <- pval.stres[, 2]

data(rice_normal)
pval.control <- pvalue.hub(rice_normal, beta=6, m=18, s=80, plot=FALSE)
p2 <- pval.control[, 2]
HubStatus(p1,p2,alpha=0.0001)



