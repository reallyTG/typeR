library(StatDA)


### Name: cor.sign
### Title: Correlation Matrix
### Aliases: cor.sign
### Keywords: univar multivariate

### ** Examples

data(chorizon)
x=chorizon[,c("Ca","Cu","Mg","Na","P","Sr","Zn")]

cor.sign(log10(x),method="spearman")



