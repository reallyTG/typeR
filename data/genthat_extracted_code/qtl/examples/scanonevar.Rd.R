library(qtl)


### Name: scanonevar
### Title: Genome scan for QTL affecting mean and/or variance
### Aliases: scanonevar
### Keywords: models

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- fake.bc[18:19,]
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=2.5)
out <- scanonevar(fake.bc)
color <- c("slateblue", "violetred")
plot(out, lod=1:2, col=color, bandcol="gray80")
legend("topright", lwd=2, c("mean", "variance"), col=color)

# use format="allpeaks" to get summary for each of mean and variance
#  also consider format="tabByCol" or format="tabByChr"
summary(out, format="allpeaks")

# with sex and age as covariates
covar <- fake.bc$pheno[,c("sex", "age")]
out.cov <- scanonevar(fake.bc, mean_covar=covar, var_covar=covar)



