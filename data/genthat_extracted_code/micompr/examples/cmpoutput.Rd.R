library(micompr)


### Name: cmpoutput
### Title: Compares output observations from two or more groups
### Aliases: cmpoutput

### ** Examples


# Comparing the first output ("Pop.Sheep") of one the provided datasets.
cmp <-
 cmpoutput("SheepPop", 0.8, pphpc_ok$data[["Pop.Sheep"]], pphpc_ok$obs_lvls)

# Compare bogus outputs created from 2 random sources, 5 observations per
# source, 20 variables each, yielding a 10 x 20 data matrix.
data <- matrix(c(rnorm(100), rnorm(100, mean = 1)), nrow = 10, byrow = TRUE)
olvls <- factor(c(rep("A", 5), rep("B", 5)))
cmp <- cmpoutput("Bogus", 0.7, data, olvls)




