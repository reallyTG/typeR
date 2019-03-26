library(qtl)


### Name: scantwo
### Title: Two-dimensional genome scan with a two-QTL model
### Aliases: scantwo
### Keywords: models

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=5)
out.2dim <- scantwo(fake.f2, method="hk")
plot(out.2dim)

# permutations
## Don't show: 
permo.2dim <- scantwo(fake.f2, method="hk", n.perm=2)
## End(Don't show)
## Not run: permo.2dim <- scantwo(fake.f2, method="hk", n.perm=1000)
summary(permo.2dim, alpha=0.05)

# summary with p-values
summary(out.2dim, perms=permo.2dim, pvalues=TRUE,
        alphas=c(0.05, 0.10, 0.10, 0.05, 0.10))

# covariates
data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=16:17)
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=10)

ac <- pull.pheno(fake.bc, c("sex","age"))
ic <- pull.pheno(fake.bc, "sex")

out <- scantwo(fake.bc, method="hk", pheno.col=1,
               addcovar=ac, intcovar=ic)
plot(out)



