library(qtl)


### Name: summary.fitqtl
### Title: Summary of fit of qtl model
### Aliases: summary.fitqtl
### Keywords: print

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

# fit model with 3 interacting QTLs interacting
# (performing a drop-one-term analysis)
lod <- fitqtl(fake.f2, pheno.col=1, qtl, formula=y~Q1*Q2*Q3,
              method="hk")
summary(lod)



