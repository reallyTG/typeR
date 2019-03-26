library(rubias)


### Name: mixture_draw
### Title: Separate a chosen proportion of a reference dataset into a
###   mixture with known population proportions
### Aliases: mixture_draw
### Keywords: internal

### ** Examples

rhos <- as.vector(gtools::rdirichlet(1, table(alewife$repunit)))
cross_val <- mixture_draw(D = alewife, rhos = rhos, N = 100, min_remaining = .005)




