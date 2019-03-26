library(PROSPER)


### Name: pop_germc
### Title: Germination
### Aliases: pop_germc

### ** Examples

struc_preparation(Rmx=10, n_loci=2, epis=0, dom=1)
ls()
gen_freq( af=c(0.01,0.8), n_seeds=10000)
#Distribute the individuals to three cohorts with the germination 
#probabilities 0.2, 0.4 and 0.4.
pop_germc( init_sb="initialSB", germ=c(0.2,0.4,0.4))
rm(mf, dfgenotype, xprobab) 



