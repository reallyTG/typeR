library(agop)


### Name: index_lp
### Title: The l_p-index
### Aliases: index.lp index_lp

### ** Examples

x <- runif(100, 0, 100)
index.lp(x, Inf, identity)  # two-dimensional value, can not be used
                            # directly in the analysis
index.lp(x, Inf, prod)      # the MAXPROD-index (one-dimensional) [default]



