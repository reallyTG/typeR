library(TPD)


### Name: Rao
### Title: Rao's Quadratic Entropy and its Partition
### Aliases: Rao

### ** Examples

# 1.  Compute the TPDs of three different species.
traits_iris <- iris[, c("Sepal.Length", "Sepal.Width")]
sp_iris <- iris$Species
TPDs_iris <- TPDs(species = sp_iris, traits_iris)
#2. Compute the dissimilarity between the three species:
dissim_iris_sp <- dissim(TPDs_iris)
#3. Compute the TPDc of five different communities:
abundances_comm_iris <- matrix(c(c(0.9,  0.1, 0), # setosa dominates
                                 c(0.4,  0.5, 0.1 ),
                                 c(0.15, 0.7, 0.15), #versicolor dominates
                                 c(0.1,  0.5, 0.4),
                                 c(0,    0.1, 0.9)), #virginica dominates
                           ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:5),
                             unique(iris$Species)))
TPDc_iris <- TPDc( TPDs = TPDs_iris, sampUnit = abundances_comm_iris)

#4. Compute Rao:
Rao_iris <- Rao(diss = dissim_iris_sp, TPDc = TPDc_iris)



