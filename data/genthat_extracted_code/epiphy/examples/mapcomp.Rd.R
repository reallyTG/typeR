library(epiphy)


### Name: mapcomp
### Title: Map Comparison procedure.
### Aliases: mapcomp mapcomp.data.frame mapcomp.matrix mapcomp.count
###   mapcomp.incidence

### ** Examples

set.seed(123)
my_res <- mapcomp(codling_moths, delta = 1, bandwidth = 11,
                  edge_correction = FALSE, nperm = 20)
my_res
plot(my_res)

set.seed(123)
my_count <- count(codling_moths, mapping(x = xm, y = ym))
my_res <- mapcomp(my_count, delta = 1, bandwidth = 11,
                  edge_correction = FALSE, nperm = 20)
my_res
plot(my_res, bins = 10)




