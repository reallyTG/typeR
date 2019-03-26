library(qtl)


### Name: addint
### Title: Add pairwise interaction to a multiple-QTL model
### Aliases: addint
### Keywords: models

### ** Examples

data(fake.f2)

# take out several QTLs and make QTL object
qc <- c(1, 8, 13)
qp <- c(26, 56, 28)
fake.f2 <- subset(fake.f2, chr=qc)
## Don't show: 
fake.f2 <- subset(fake.f2, ind=1:50)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=2, err=0.001)
qtl <- makeqtl(fake.f2, qc, qp, what="prob")

# try all possible pairwise interactions, one at a time
addint(fake.f2, pheno.col=1, qtl, formula=y~Q1+Q2+Q3, method="hk")



