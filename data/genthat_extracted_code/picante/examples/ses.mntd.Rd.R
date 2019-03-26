library(picante)


### Name: ses.mntd
### Title: Standardized effect size of MNTD
### Aliases: ses.mntd ses.mnnd
### Keywords: univar

### ** Examples

data(phylocom)
ses.mntd(phylocom$sample, cophenetic(phylocom$phylo),null.model="taxa.labels")


