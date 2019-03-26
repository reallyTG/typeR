library(scenario)


### Name: scenario
### Title: scenario: Construct reduced trees with a predefined nodal
###   structures
### Aliases: scenario scenario-package

### ** Examples

# TEST BY GENERATING SCENARIOS FROM KNOWN CENTROIDS AND THEN
# COMPARING FIT BETWEEN THE GENERATED TREE AND INTIAL CENTROIDS.

# 1. Generate scenarios with known centroids:

centroids <- cbind(c(0,2,3), c(0,2,1), c(0,-2,-3),c(0,-2,-1))
matplot(centroids, type="l", lwd = 3, col = "black", lty = 3)
scenarios <- matrix(rep(centroids,5), ncol=20) + matrix(rnorm(60,0,0.25),ncol=20)
matlines(scenarios, col = "grey")


# 2. Assign and check nodal structure for tree:

treeStruct <- rbind(c(1,1,1,1),
                    c(2,2,5,5),
                    c(3,4,6,7))
checktree(treeStruct)


# 3. Build scenario tree:

tree <- buildtree(scenarios, treeStruct, jMax = 1000)


#4. Compare original centroids

matlines(centroids,lwd = 3, col = "black", lty = 3)
# Improved convergence is achieved by increasing the number of iterations, jMax.



