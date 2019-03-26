library(PROSPER)


### Name: gen_freq
### Title: generating the start values for PROSPER models
### Aliases: gen_freq

### ** Examples

# generate a 'dfgenotype' data.frame:
struc_preparation(Rmx=10, n_loci=2, epis=0, dom=1)
#Distribute 10000 individuals of the starting population across the genotypes. 
#The two gene loci have initial frequencies of 0.01 and 0.8.
gen_freq(af=c(0.01,0.8), n_seeds=10000)
rm(dfgenotype, mf, xprobab)



