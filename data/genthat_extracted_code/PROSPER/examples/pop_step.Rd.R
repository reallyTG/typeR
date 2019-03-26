library(PROSPER)


### Name: pop_step
### Title: Surviving a non-selective process
### Aliases: pop_step

### ** Examples

struc_preparation(Rmx=10, n_loci=2, epis=0, dom=1)
gen_freq(af=c(0.01,0.8), n_seeds=10000)
#How many individuals of each genotype will reach the next growth stage?
pop_step(start="initialSB",  stepname="survivingthewinter",
                            surv_prob=0.4)



