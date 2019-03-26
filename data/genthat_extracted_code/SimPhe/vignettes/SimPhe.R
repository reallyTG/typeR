## ---- eval = F, error = F, results='hide'--------------------------------
#  install.packages(SimPhe)

## ---- echo = T, results='hide'-------------------------------------------
# load package
library(SimPhe)

## ---- echo = T, results='hide'-------------------------------------------
# get file path of simulation parameters
# (two shared SNP pairs and one independent SNP pair for each phenotype)
fpar.path <- system.file("extdata", "simupars.txt", package="SimPhe")

# get file path of genotype file: rows are individuals and columns are SNPs
fgeno.path <- system.file("extdata", "10SNP.txt", package="SimPhe")

## ---- echo = T, results='hide'-------------------------------------------
# simulate phenotype(s)
phe <- sim.phe(sim.pars = fpar.path, 
               fgeno = fgeno.path, 
               ftype = "snp.head", 
               seed = 123, 
               fwrite = FALSE)

## ---- echo = T, results='markup'-----------------------------------------
genepars

## ---- echo = T, results='markup'-----------------------------------------
# regression coefficients for simulating phenotype 1
gene.coefficients
# allele frequencies of SNPs for simulating phenotype 1
allele.freq

# calculate genetic variance
genevar <- calc.gene.var(gene.coefficients, allele.freq)

# the variance of simulated phenotype 1
phe1var <- var(phe[, "p1"])

# heritability of simulated phenotype 1
simuht <- genevar / phe1var
simuht

## ---- echo = T, results='markup'-----------------------------------------
# get regression coefficients settings for phenotype 2
genecoef <- get.gene.coef(main.pars = specify.pars(genetic.pars = genepars,
                                                   effect.type  = "main",
                                                   phe.index    = 2),
                          epi.pars  = specify.pars(genetic.pars = genepars,
                                                   effect.type  = "epistasis",
                                                   phe.index    = 2))
# get genotype data
genotype <- read.geno(fname = fgeno.path, ftype = "snp.head")

# get allele frequencies of the SNPs set for phenotype 2
freq2 <- get.freq(geno = genotype,
                  epi.pars  = specify.pars(genetic.pars = genepars,
                                           effect.type  = "epistasis",
                                           phe.index    = 2))

# get noise variation
exp.noise.var <- get.noise.var(gene.coef = genecoef,
                               freq = freq2,
                               heritability = 0.45)

## ---- echo = T, results='markup'-----------------------------------------
# correlation test
cor.test(phe[, "p1"], phe[, "p2"])

## ---- echo = T, results='markup'-----------------------------------------
# get file path of simulation parameters
# (different SNP pairs for each phenotype)
fpar.path <- system.file("extdata", "sep_simupars.txt", package="SimPhe")

# simulate phenotype(s)
indphe <- sim.phe(sim.pars = fpar.path,
                  fgeno = fgeno.path,
                  ftype = "snp.head",
                  seed = 123,
                  fwrite = FALSE)

## ---- echo = T, results='markup'-----------------------------------------
# test original correlation
cor.test(indphe[, "p1"], indphe[, "p2"])

## ---- echo = T, results='markup'-----------------------------------------
# correlation matrix
corm <- matrix(c(1, 0.6, 0.6, 1), ncol = 2)
corm

## ---- echo = T, results='markup'-----------------------------------------
apply(indphe, 2, mean)
apply(indphe, 2, sd)

## ---- echo = T, results='markup'-----------------------------------------
# build correlation
corphe <- build.cor.phe(indphe, corMtr = corm)

## ---- echo = T, results='markup'-----------------------------------------
# check mean and standard deviation of new data set
apply(corphe, 2, mean)
apply(corphe, 2, sd)

## ---- echo = T, results='markup'-----------------------------------------
# test correlation
cor.test(corphe[, "p1"], corphe[, "p2"])

