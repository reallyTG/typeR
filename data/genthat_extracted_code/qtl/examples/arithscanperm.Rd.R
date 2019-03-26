library(qtl)


### Name: arithscanperm
### Title: Arithmetic Operators for permutation results
### Aliases: +.scanoneperm -.scanoneperm +.scantwoperm -.scantwoperm
### Keywords: arith

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=1:2)
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=2.5)

# covariates
ac <- pull.pheno(fake.bc, c("sex","age"))
ic <- pull.pheno(fake.bc, "sex")

# set seed
theseed <- round(runif(1, 1, 10^8))
set.seed(theseed)

# permutations with additive but not the interactive covariate
## Not run: operm.acovar <- scanone(fake.bc, addcovar=ac, n.perm=1000)
## Don't show: 
operm.acovar <- scanone(fake.bc, pheno.col=1, method="hk", addcovar=ac, n.perm=100)
## End(Don't show)

# re-set the seed
set.seed(theseed)

# permutations with interactive covariate
## Not run: 
##D operm.icovar <- scanone(fake.bc, addcovar=ac, intcovar=ic, 
##D                       n.perm=1000)
## End(Not run)## Don't show: 
operm.icovar <- scanone(fake.bc, pheno.col=1, addcovar=ac,
                      intcovar=ic, method="hk", n.perm=100)
## End(Don't show)

# permutation results for the QTL x covariate interaction
operm.gxc <- operm.icovar - operm.acovar

# LOD thresholds
summary(operm.gxc)



