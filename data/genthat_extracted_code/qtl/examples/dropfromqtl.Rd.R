library(qtl)


### Name: dropfromqtl
### Title: Drop a QTL from a qtl object
### Aliases: dropfromqtl
### Keywords: utilities

### ** Examples

data(fake.f2)

# take out several QTLs and make QTL object
qc <- c(1, 6, 13)
qp <- c(25.8, 33.6, 18.63)
fake.f2 <- subset(fake.f2, chr=qc)
## Don't show: 
fake.f2 <- subset(fake.f2, ind=1:50)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=2, err=0.001)
qtl <- makeqtl(fake.f2, qc, qp, what="prob")

newqtl <- dropfromqtl(qtl, chr=1, pos=25.8)
altqtl <- dropfromqtl(qtl, index=1)



