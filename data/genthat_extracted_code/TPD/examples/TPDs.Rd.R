library(TPD)


### Name: TPDs
### Title: Trait Probability Density of Populations
### Aliases: TPDs

### ** Examples


# 1.  Compute the TPDs of three different species
traits_iris <- iris[, c("Sepal.Length", "Sepal.Width")]
sp_iris <- iris$Species
example_sp <- TPDs(species = sp_iris, traits = traits_iris)

# 2.  Two different populations of each species
samples_ex <- rep(c(rep(1, 25), rep(2, 25)), 3)
example_pop <- TPDs (species = sp_iris, traits = traits_iris,
     samples = samples_ex)




