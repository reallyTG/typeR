library(qtl)


### Name: condense.scantwo
### Title: Condense the output from a 2-d genome scan
### Aliases: condense.scantwo
### Keywords: print

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(18:19,"X"))
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2)

out2 <- scantwo(fake.f2, method="hk")

out2c <- condense(out2)
summary(out2c, allpairs=FALSE)
max(out2c)



