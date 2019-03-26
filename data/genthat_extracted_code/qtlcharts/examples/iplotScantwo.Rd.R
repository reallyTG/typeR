library(qtlcharts)


### Name: iplotScantwo
### Title: Interactive plot of 2d genome scan
### Aliases: iplotScantwo
### Keywords: hplot

### ** Examples

library(qtl)
data(fake.f2)
## Don't show: 
fake.f2 <- fake.f2[c(1, 13, "X"),]
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=5)
out <- scantwo(fake.f2, method="hk", verbose=FALSE)
## No test: 
iplotScantwo(out, fake.f2)
## End(No test)




