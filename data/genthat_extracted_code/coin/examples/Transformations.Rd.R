library(coin)


### Name: Transformations
### Title: Functions for Data Transformation
### Aliases: id_trafo rank_trafo normal_trafo median_trafo savage_trafo
###   consal_trafo koziol_trafo klotz_trafo mood_trafo ansari_trafo
###   fligner_trafo logrank_trafo logrank_weight maxstat_trafo
###   fmaxstat_trafo ofmaxstat_trafo f_trafo of_trafo trafo mcp_trafo
### Keywords: manip

### ** Examples

## Dummy matrix, two-sample problem (only one column)
f_trafo(gl(2, 3))

## Dummy matrix, K-sample problem (K columns)
x <- gl(3, 2)
f_trafo(x)

## Score matrix
ox <- as.ordered(x)
of_trafo(ox)
of_trafo(ox, scores = c(1, 3:4))
of_trafo(ox, scores = list(s1 = 1:3, s2 = c(1, 3:4)))

## Normal scores
y <- runif(6)
normal_trafo(y)

## All together now
trafo(data.frame(x = x, ox = ox, y = y), numeric_trafo = normal_trafo)

## The same, but allows for fine-tuning
trafo(data.frame(x = x, ox = ox, y = y), var_trafo = list(y = normal_trafo))

## Transformations for maximally selected statistics
maxstat_trafo(y)
fmaxstat_trafo(x)
ofmaxstat_trafo(ox)

## Apply transformation blockwise (as in the Friedman test)
trafo(data.frame(y = 1:20), numeric_trafo = rank_trafo, block = gl(4, 5))

## Multiple comparisons
dta <- data.frame(x)
mcp_trafo(x = "Tukey")(dta)

## The same, but useful when specific contrasts are desired
K <- rbind("2 - 1" = c(-1,  1, 0),
           "3 - 1" = c(-1,  0, 1),
           "3 - 2" = c( 0, -1, 1))
mcp_trafo(x = K)(dta)



