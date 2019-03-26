library(flexmet)


### Name: sim_bmat
### Title: Randomly Generate FMP Parameters
### Aliases: sim_bmat

### ** Examples

## generate FMP item parameters for 5 items all with k = 2
set.seed(2342)
pars <- sim_bmat(n_items = 5, k = 2)
pars$bmat

## generate FMP item parameters for 5 items with varying k values
set.seed(2432)
pars <- sim_bmat(n_items = 5, k = c(1, 2, 0, 0, 2))
pars$bmat




