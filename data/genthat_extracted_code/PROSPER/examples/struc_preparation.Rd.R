library(PROSPER)


### Name: struc_preparation
### Title: Generating data input and output structures
### Aliases: struc_preparation

### ** Examples

#generate the genotype and probability tables for a simulation with two resistance 
#loci with one dominant and one partial dominant resistant allele, no epistasis, and a 
#maximumx resistance value of 10. 
ls()
struc_preparation(Rmx=10, n_loci=2, epis=0, dom=c(1,0.3))
ls()
rm(dfgenotype, mf, xprobab)



