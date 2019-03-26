library(PROSPER)


### Name: gen_diploid
### Title: Diploid genetics: recombination of alleles
### Aliases: gen_diploid

### ** Examples

# generate a 'dfgenotype' data.frame:
struc_preparation(Rmx=10, n_loci=2, epis=0, dom=1)
#Distribute 10000 individuals of the starting population across the genotypes. 
#The two gene loci have initial frequencies of 0.01 and 0.8.
gen_freq(af=c(0.01,0.8), n_seeds=10000)
# The column "initialSB" represents the parent generation, which recombines and 
#therefore defines the genetics of the new seeds
newseeds <- 10000
gen_diploid(start="initialSB", result="followingSB")
rm(dfgenotype, mf, newseeds, xprobab)



