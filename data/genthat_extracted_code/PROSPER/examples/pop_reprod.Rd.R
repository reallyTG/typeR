library(PROSPER)


### Name: pop_reprod
### Title: Seed production and crop yield
### Aliases: pop_reprod

### ** Examples

struc_preparation(Rmx=10, n_loci=2, epis=0, dom=1)
#Distribute 10000 individuals of the starting population across the genotypes provided by tmp. 
#The two gene loci have initial frequencies of 0.01 and 0.8.
gen_freq(af=c(0.01,0.8), n_seeds=10000, max_vec_length=1e+07)
pop_reprod("initialSB",  area=100, kw=0.5, pen_co=1, kc=0.05, dc=100, 
                         crop_inr="wheat", SSmax=3000, yield=TRUE)
rm(producedseeds, dfgenotype, mf, xprobab, propyield)



