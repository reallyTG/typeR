library(qtl)


### Name: addqtl
### Title: Scan for an additional QTL in a multiple-QTL model
### Aliases: addqtl
### Keywords: models

### ** Examples

data(fake.f2)

# take out several QTLs and make QTL object
qc <- c(1, 8, 13)
qp <- c(26, 56, 28)

fake.f2 <- subset(fake.f2, chr=c(1,2,3,8,13))
## Don't show: 
fake.f2 <- subset(fake.f2, ind=1:50)
## End(Don't show)

fake.f2 <- calc.genoprob(fake.f2, step=2, err=0.001)
qtl <- makeqtl(fake.f2, qc, qp, what="prob")

# scan for an additional QTL
out1 <- addqtl(fake.f2, qtl=qtl, formula=y~Q1+Q2+Q3, method="hk")
max(out1)

# scan for an additional QTL that interacts with the locus on chr 1
out2 <- addqtl(fake.f2, qtl=qtl, formula=y~Q1*Q4+Q2+Q3, method="hk")
max(out2)

# plot interaction LOD scores
plot(out2-out1)



