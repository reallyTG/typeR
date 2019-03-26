library(ionr)


### Name: ind_excl_step
### Title: One step in indicator exclusion procedure
### Aliases: ind_excl_step

### ** Examples

## Create a scale-outcome set that violates ION. Only 2 indicators out of 8 relate to
## the outcome, the others just relate to the 2 indicators
set.seed(466)
a<-scale_sim(n=2500, to_n=2, tn_n=6)
res=ind_excl_step(a[[1]],a[[2]])
print(res)

# note that the p-values for upper items (7 & 8 ) are much smaller than for the rest

#row number   indicator number
#r.test.t     t value of the r.test.
#t.test.p     p value of the r.test.
#cor_excl     correlation between outcome and sum-score when an item is excluded.
#cor_all      correlation between outcome and sum-score when all items are included
# (i.e., full scale).
#cor.excl_all correlation between two sum-scores.



