library(hamlet)


### Name: match.ga
### Title: Non-bipartite matching using the Genetic Algorithm (GA)
### Aliases: match.ga
### Keywords: ga

### ** Examples

# Set up a distance matrix and add dummies, then run GA
data(vcapwide)

# Construct an Euclidean distance example distance matrix using 15 observations from the VCaP study
d <- as.matrix(dist(vcapwide[1:15,c("PSAWeek10", "BWWeek10")]))
# Or rather, z-score transform all input variables first
d2 <- as.matrix(dist(scale(vcapwide[1:15,c("PSAWeek10", "BWWeek10")])))

# Notice that random simulations take place, so we will fix the RNG seed for reproducibility
set.seed(1)
# Resulting genetic algorithm progression is plotted by default
ga <- match.ga(d2, g=3, generations=60)
str(ga)
# Submatches, i.e. similar individuals that ought to be allocated to separate groups
ga[[2]]




