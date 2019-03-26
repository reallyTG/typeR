library(netdiffuseR)


### Name: plot_adopters
### Title: Visualize adopters and cumulative adopters
### Aliases: plot_adopters

### ** Examples

# Generating a random diffnet -----------------------------------------------
set.seed(821)
diffnet <- rdiffnet(100, 5, seed.graph="small-world", seed.nodes="central")

plot_adopters(diffnet)

# Alternatively, we can use a TOA Matrix
toa <- sample(c(NA, 2010L,2015L), 20, TRUE)
mat <- toa_mat(toa)
plot_adopters(mat$cumadopt)



