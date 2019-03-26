library(permute)


### Name: how
### Title: How to define a permutation design?
### Aliases: how print.how Blocks Within Plots
### Keywords: utils

### ** Examples

## Set up factors for the Plots and Blocks
plts <- gl(4, 10) ## 4 Plots of 10 samples each
blks <- gl(2, 20) ## 2 Blocks of 20 samples each

## permutation design
h1 <- how(within = Within(type = "series", mirror = TRUE),
          plots = Plots(strata = plts, type = "series"),
          blocks = blks)

## The design can be updated...
## ... remove the blocking:
update(h1, blocks = NULL)

## ... or switch the type of shuffling at a level:
#update(h1, plots = update(getPlots(h1), type = "none"))
plots2 <- update(getPlots(h1), type = "none")
update(h1, plots = plots2)



