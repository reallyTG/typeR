library(qtl)


### Name: refineqtl
### Title: Refine the positions of QTL
### Aliases: refineqtl
### Keywords: utilities

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=c(2,5))
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=2)
qtl <- makeqtl(fake.bc, chr=c(2,5), pos=c(32.5, 17.5), what="prob")
rqtl <- refineqtl(fake.bc, qtl=qtl, method="hk")



