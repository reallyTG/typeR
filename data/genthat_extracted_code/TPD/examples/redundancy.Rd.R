library(TPD)


### Name: redundancy
### Title: Functional Redundancy of Communities
### Aliases: redundancy

### ** Examples

#1. Compute the TPDs of three different species.
traits_iris <- iris[, c("Sepal.Length", "Sepal.Width")]
sp_iris <- iris$Species
TPDs_iris <- TPDs(species = sp_iris, traits_iris)

#2. Compute the TPDc of five different communities:
abundances_comm_iris <- matrix(c(c(0.9,  0.05, 0.05), #I. setosa dominates
                                 c(0.0,  0.5,  0.5 ), #I. setosa absent
                                 c(0.33, 0.33, 0.33), #Equal abundances
                                 c(0.1,  0.45, 0.45), #Versicolor and virginica dominate
                                 c(0.5,  0,    0.5)), #versicolor absent
                           ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:5),
                           unique(iris$Species)))
TPDc_iris <- TPDc( TPDs = TPDs_iris, sampUnit = abundances_comm_iris)

#3. Estimate functional redundancy
FRed_iris <- redundancy(TPDc = TPDc_iris)



