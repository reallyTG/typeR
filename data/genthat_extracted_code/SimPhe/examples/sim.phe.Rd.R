library(SimPhe)


### Name: sim.phe
### Title: Simulation for phenotypes (SimPhe main process)
### Aliases: sim.phe

### ** Examples

#### file path of example
# simulation parameters:
fpar.path <- system.file("extdata", "simupars.txt", package="SimPhe")

# genotype file: rows are individuals and columns are SNPs
fgeno.path <- system.file("extdata", "10SNP.txt", package="SimPhe")


#### instead of a parameter file, prepared list like genepars also works
genepars


#### simulate phenotype(s)
phe <- sim.phe(sim.pars = fpar.path, fgeno = fgeno.path, ftype = "snp.head", fwrite = FALSE)
# or
phe <- sim.phe(sim.pars = genepars, fgeno = fgeno.path, ftype = "snp.head", fwrite = FALSE)

# the simulated phenotype(s)
str(phe)
head(phe)



