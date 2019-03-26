library(aSPU)


### Name: MTaSPUs
### Title: The SPU and aSPU tests for multiple traits - single SNP
###   association with GWAS summary statistics.
### Aliases: MTaSPUs

### ** Examples


# -- n.snp: number of SNPs
# -- n.trait: number of traits
# -- n.subject: number of subjects

n.snp <- 100
n.traits <- 10
n.subjects <- 1000
traits <- matrix(rnorm(n.subjects*n.traits), n.subjects, n.traits)
v <- cov(traits)
allZ <- rmvnorm(n.snp, sigma=v)
colnames(allZ) <- paste("trait", 1:n.traits, sep="")
rownames(allZ) <- paste("snp", 1:n.snp, sep="")


r <- estcov(allZ)
MTaSPUs(Z = allZ, v = r, B = 100, pow = c(1:4, Inf), transform = FALSE)
MTaSPUs(Z = allZ[1,], v = r, B = 100, pow = c(1:4, Inf), transform = FALSE)
minP(Zi= allZ[1,], r = r)




