library(dhga)


### Name: pvalue.hub
### Title: Compuation of gene connection sigificance values in a Gene
###   Co-expression network
### Aliases: pvalue.hub
### Keywords: gene co-expression network hub gene p value plot

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt)
beta=6
m=18
s=80
pvalue.hub(x, beta, m, s, plot=TRUE)



