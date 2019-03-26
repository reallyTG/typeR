library(TPD)


### Name: uniqueness
### Title: Functional Uniqueness of Ecological Units
### Aliases: uniqueness

### ** Examples

# 1.  Compute the TPDs of three different species
traits_iris <- iris[, c("Sepal.Length", "Sepal.Width")]
sp_iris <- iris$Species
example_TPDs <- TPDs(species = sp_iris, traits = traits_iris)

#2. Three different communities with different abundances of each species
example_abundances <- matrix(c(c(0.5, 0.3, 0.2,
                                 0.1, 0.8, 0.1,
                                 0.5, 0,   0.5)), #I. virg. dominates; setosa absent
                         ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:3),
                         unique(iris$Species)))
example_TPDc <- TPDc (TPDs = example_TPDs, sampUnit = example_abundances)

#3. Calculate the uniqueness of each species in each community
example_uniqueness <- uniqueness (TPDs = example_TPDs, TPDc = example_TPDc)




