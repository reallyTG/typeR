library(TPD)


### Name: dissim
### Title: Overlap-Based Functional Dissimilarity and its Decomposition
### Aliases: dissim

### ** Examples

# 1.  Compute the TPDs of three different species:
traits_iris <- iris[, c("Sepal.Length", "Sepal.Width")]
sp_iris <- iris$Species
TPDs_iris <- TPDs(species = sp_iris, traits_iris)

 #2. Compute the TPDc of three different communities:
abundances_comm_iris <- matrix(c(c(0.9, 0.1, 0), #I. setosa dominates
                         c(0.0, 0.9,  0.1 ), #I. Versic. dominates; setosa absent
                         c(0.0, 0.1,  0.9 )), #I. virg. dominates; setosa absent
                         ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:3),
                          unique(iris$Species)))
TPDc_iris <- TPDc(TPDs = TPDs_iris, sampUnit = abundances_comm_iris)

#3. Estimate functional dissimilarity
example_dissimilarity_comm <- dissim (TPDc_iris)
example_dissimilarity_sps <- dissim (TPDs_iris)



