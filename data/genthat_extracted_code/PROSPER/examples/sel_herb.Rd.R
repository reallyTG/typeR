library(PROSPER)


### Name: sel_herb
### Title: Surviving the herbicide
### Aliases: sel_herb

### ** Examples

struc_preparation(Rmx=10, n_loci=2, epis=0, dom=1)
gen_freq( af=c(0.01,0.8), n_seeds=10000)
sel_herb(start="initialSB", result="winter", 
                       thresh=20, sdrate=0.4, rate=100, put=0.04)



