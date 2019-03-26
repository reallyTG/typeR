library(qtl)


### Name: summaryScantwoOld
### Title: Summarize the results of a two-dimensional genome scan
### Aliases: summaryScantwoOld
### Keywords: print

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(1,6,13))
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=5)
out.2dim <- scantwo(fake.f2, method="hk")

# All pairs of loci
summaryScantwoOld(out.2dim)

# Pairs meeting specified criteria
summaryScantwoOld(out.2dim, c(7, 3, 3))

# Pairs with both conditional LODs > 2
summaryScantwoOld(out.2dim,c(0,1000,2))

# Pairs with interaction LOD is above 3
summaryScantwoOld(out.2dim,c(0,3,1000))



