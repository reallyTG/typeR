library(qtl)


### Name: fitqtl
### Title: Fit a multiple-QTL model
### Aliases: fitqtl
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

# fit model with 3 interacting QTLs interacting
# (performing a drop-one-term analysis)
lod <- fitqtl(fake.f2, pheno.col=1, qtl, formula=y~Q1*Q2*Q3, method="hk")
summary(lod)

## Not run: 
##D # fit an additive QTL model
##D lod.add <- fitqtl(fake.f2, pheno.col=1, qtl, formula=y~Q1+Q2+Q3, method="hk")
##D summary(lod.add)
##D 
##D # fit the model including sex as an interacting covariate
##D Sex <- data.frame(Sex=pull.pheno(fake.f2, "sex"))
##D lod.sex <- fitqtl(fake.f2, pheno.col=1, qtl, formula=y~Q1*Q2*Q3*Sex,
##D                   cov=Sex, method="hk")
##D summary(lod.sex)
##D 
##D # fit the same with an additive model
##D lod.sex.add <- fitqtl(fake.f2, pheno.col=1, qtl, formula=y~Q1+Q2+Q3+Sex,
##D                       cov=Sex, method="hk")
##D summary(lod.sex.add)
##D 
##D # residuals
##D residuals <- attr(lod.sex.add, "residuals")
##D plot(residuals)
## End(Not run)


