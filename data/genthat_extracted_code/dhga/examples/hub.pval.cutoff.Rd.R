library(dhga)


### Name: hub.pval.cutoff
### Title: Identification of hub genes in a Gene Co-expression Network
###   based on gene connection significance values
### Aliases: hub.pval.cutoff
### Keywords: gene co-expression network hub gene top rank p value

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt)
beta=6
m=18
s=80
n=20
hub.pval.cutoff(x, beta, m, s, n)



