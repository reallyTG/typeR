library(ionr)


### Name: ind_excl_inc
### Title: Incrementally calls ind_excl_step
### Aliases: ind_excl_inc

### ** Examples

## Create a scale-outcome set that violates ION. Only 2 last indicators out of 8
## relate to the outcome, the others just relate to the 2 indicators
set.seed(466)
a<-scale_sim(n=2500, to_n=2, tn_n=6)
# run the exclusion procedure. Pcrit taken from Table 2 in Vainik et al., 2015,
# European Journal of Personality
res=ind_excl_inc(a[[1]],a[[2]], pcrit=0.0037)
# which indicators does the procedure exclude?
res




