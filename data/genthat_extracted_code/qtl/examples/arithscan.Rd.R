library(qtl)


### Name: arithscan
### Title: Arithmetic operators for scanone and scantwo results
### Aliases: +.scanone -.scanone +.scantwo -.scantwo
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

# scan with additive but not the interactive covariate
out.acovar <- scanone(fake.bc, addcovar=ac)

# scan with interactive covariate
out.icovar <- scanone(fake.bc, addcovar=ac, intcovar=ic)

# plot the difference of with and without the interactive covariate
#     This is a LOD score for a test of QTL x covariate interaction
plot(out.icovar-out.acovar)



