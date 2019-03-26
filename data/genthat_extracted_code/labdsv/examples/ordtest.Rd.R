library(labdsv)


### Name: ordtest
### Title: Ordination Distribution Test
### Aliases: ordtest
### Keywords: multivariate

### ** Examples

data(bryceveg)
data(brycesite)
dis.bc <- dsvdis(bryceveg,'bray/curtis')
pco.bc <- pco(dis.bc)
plot(pco.bc)
demo <- ordtest(pco.bc,brycesite$quad)
demo$p



