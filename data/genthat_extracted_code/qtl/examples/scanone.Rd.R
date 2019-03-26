library(qtl)


### Name: scanone
### Title: Genome scan with a single QTL model
### Aliases: scanone
### Keywords: models

### ** Examples

###################
# Normal Model
###################
data(hyper)
## Don't show: 
hyper <- subset(hyper,chr=1:4,ind=1:100)
## End(Don't show)
# Genotype probabilities for EM and H-K
## Not run: hyper <- calc.genoprob(hyper, step=2.5)
## Don't show: 
hyper <- calc.genoprob(hyper)
## End(Don't show)
out.em <- scanone(hyper, method="em")
out.hk <- scanone(hyper, method="hk")

# Summarize results: peaks above 3
summary(out.em, thr=3)
summary(out.hk, thr=3)

# An alternate method of summarizing:
#     patch them together and then summarize
out <- c(out.em, out.hk)
summary(out, thr=3, format="allpeaks")

# Plot the results
plot(out.hk, out.em)
plot(out.hk, out.em, chr=c(1,4), lty=1, col=c("blue","black"))

# Imputation; first need to run sim.geno
# Do just chromosomes 1 and 4, to save time
## Not run: 
##D hyper.c1n4 <- sim.geno(subset(hyper, chr=c(1,4)),
##D                        step=2.5, n.draws=8)
## End(Not run)## Don't show: 
hyper.c1n4 <- sim.geno(subset(hyper, chr=c(1,4)),
                       step=0, n.draws=4)
## End(Don't show)
out.imp <- scanone(hyper.c1n4, method="imp")
summary(out.imp, thr=3)

# Plot all three results
plot(out.imp, out.hk, out.em, chr=c(1,4), lty=1,
     col=c("red","blue","black"))

# extended Haley-Knott
out.ehk <- scanone(hyper, method="ehk")
plot(out.hk, out.em, out.ehk, chr=c(1,4))

# Permutation tests
## Not run: permo <- scanone(hyper, method="hk", n.perm=1000)
## Don't show: 
permo <- scanone(hyper, method="hk", n.perm=5)
## End(Don't show)

# Threshold from the permutation test
summary(permo, alpha=c(0.05, 0.10))

# Results above the 0.05 threshold
summary(out.hk, perms=permo, alpha=0.05)


####################
# scan with square-root of phenotype
#   (Note that pheno.col can be a vector of phenotype values)
####################
out.sqrt <- scanone(hyper, pheno.col=sqrt(pull.pheno(hyper, 1)))
plot(out.em - out.sqrt, ylim=c(-0.1,0.1),
     ylab="Difference in LOD")
abline(h=0, lty=2, col="gray")


####################
# Stratified permutations
####################
extremes <- (nmissing(hyper)/totmar(hyper) < 0.5)

## Not run: 
##D operm.strat <- scanone(hyper, method="hk", n.perm=1000,
##D                        perm.strata=extremes)
## End(Not run)## Don't show: 
operm.strat <- scanone(hyper, method="hk", n.perm=5,
                       perm.strata=extremes)
## End(Don't show)

summary(operm.strat)



####################
# X-specific permutations
####################
data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(18:19,"X"))
## End(Don't show)
## Not run: fake.f2 <- calc.genoprob(fake.f2, step=2.5)
## Don't show: 
fake.f2 <- calc.genoprob(fake.f2, step=0)
## End(Don't show)

# genome scan
out <- scanone(fake.f2, method="hk")

# X-chr-specific permutations
## Not run: operm <- scanone(fake.f2, method="hk", n.perm=1000, perm.Xsp=TRUE)
## Don't show: 
operm <- scanone(fake.f2, method="hk", n.perm=5, perm.Xsp=TRUE)
## End(Don't show)

# thresholds
summary(operm)

# scanone summary with p-values
summary(out, perms=operm, alpha=0.05, pvalues=TRUE)



###################
# Non-parametric
###################
out.np <- scanone(hyper, model="np")
summary(out.np, thr=3)

# Plot with previous results
plot(out.np, chr=c(1,4), lty=1, col="green")
plot(out.imp, out.hk, out.em, chr=c(1,4), lty=1,
     col=c("red","blue","black"), add=TRUE)

###################
# Two-part Model
###################
data(listeria)
## Don't show: 
listeria <- subset(listeria,chr=c(1,5,13),ind=!is.na(listeria$pheno[,1]))
## End(Don't show)
## Not run: listeria <- calc.genoprob(listeria,step=2.5)
## Don't show: 
listeria <- calc.genoprob(listeria,step=0)
## End(Don't show)
out.2p <- scanone(listeria, model="2part", upper=TRUE)
summary(out.2p, thr=c(5,3,3), format="allpeaks")

# Plot all three LOD scores together
plot(out.2p, out.2p, out.2p, lodcolumn=c(2,3,1), lty=1, chr=c(1,5,13),
     col=c("red","blue","black"))

# Permutation test
## Not run: 
##D permo <- scanone(listeria, model="2part", upper=TRUE,
##D                  n.perm=1000)
## End(Not run)## Don't show: 
permo <- scanone(listeria, model="2part", upper=TRUE,
                 n.perm=3)
## End(Don't show)

# Thresholds
summary(permo)

###################
# Binary model
###################
binphe <- as.numeric(pull.pheno(listeria,1)==264)
out.bin <- scanone(listeria, pheno.col=binphe, model="binary")
summary(out.bin, thr=3)

# Plot LOD for binary model with LOD(p) from 2-part model
plot(out.bin, out.2p, lodcolumn=c(1,2), lty=1, col=c("black", "red"),
     chr=c(1,5,13))

# Permutation test
## Not run: 
##D permo <- scanone(listeria, pheno.col=binphe, model="binary",
##D                  n.perm=1000)
## End(Not run)## Don't show: 
permo <- scanone(listeria, pheno.col=binphe, model="binary",
                 n.perm=3)
## End(Don't show)

# Thresholds
summary(permo)

###################
# Covariates
###################
data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=c(2,5,10))
## End(Don't show)
## Not run: fake.bc <- calc.genoprob(fake.bc, step=2.5)
## Don't show: 
fake.bc <- calc.genoprob(fake.bc, step=0)
## End(Don't show)

# genome scans without covariates
out.nocovar <- scanone(fake.bc)

# genome scans with covariates
ac <- pull.pheno(fake.bc, c("sex","age"))
ic <- pull.pheno(fake.bc, "sex")

out.covar <- scanone(fake.bc, pheno.col=1,
                     addcovar=ac, intcovar=ic)
summary(out.nocovar, thr=3)
summary(out.covar, thr=3)
plot(out.covar, out.nocovar, chr=c(2,5,10))



