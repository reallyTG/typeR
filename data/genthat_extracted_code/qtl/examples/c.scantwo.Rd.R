library(qtl)


### Name: c.scantwo
### Title: Combine columns from multiple scantwo results
### Aliases: c.scantwo cbind.scantwo
### Keywords: manip

### ** Examples

data(fake.bc)
fake.bc <- calc.genoprob(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=18:19)
## End(Don't show)
out2a <- scantwo(fake.bc, method="hk")
out2b <- scantwo(fake.bc, pheno.col=2, method="hk")

out2 <- c(out2a, out2b)



