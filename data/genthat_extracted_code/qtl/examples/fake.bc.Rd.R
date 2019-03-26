library(qtl)


### Name: fake.bc
### Title: Simulated data for a backcross
### Aliases: fake.bc
### Keywords: datasets

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc,chr=c(2,5,10))
## End(Don't show)
summary(fake.bc)
plot(fake.bc)

# genome scans without covariates
fake.bc <- calc.genoprob(fake.bc, step=2.5)
out.nocovar <- scanone(fake.bc, pheno.col=1:2)

# genome scans with covariates
ac <- pull.pheno(fake.bc, c("sex","age"))
ic <- pull.pheno(fake.bc, "sex")
out.covar <- scanone(fake.bc, pheno.col=1:2,
                      addcovar=ac, intcovar=ic)

# summaries
summary(out.nocovar, thr=3, format="allpeaks")
summary(out.covar, thr=3, format="allpeaks")

# plots
plot(out.nocovar, out.covar, chr=c(2,5,10), lod=1, col="blue",
     lty=1:2, ylim=c(0,13))
plot(out.nocovar, out.covar, chr=c(2,5,10), lod=2, col="red",
     lty=1:2, add=TRUE)



