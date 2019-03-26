library(qtl)


### Name: addtoqtl
### Title: Add to a qtl object
### Aliases: addtoqtl
### Keywords: utilities

### ** Examples

data(fake.f2)

# take out several QTLs and make QTL object
qc <- c(1, 6, 13)
qp <- c(25.8, 33.6, 18.63)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(qc, 14))
## End(Don't show)
## Don't show: 
fake.f2 <- subset(fake.f2, ind=1:50)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=2, err=0.001)
qtl <- makeqtl(fake.f2, qc, qp, what="prob")
qtl <- addtoqtl(fake.f2, qtl, 14, 35)



