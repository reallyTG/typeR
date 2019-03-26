library(RandPro)


### Name: form_matrix
### Title: Forms the Projection Matrix
### Aliases: form_matrix
### Keywords: Achlioptas, Dimension_Reduction, Gaussian-Distribution,
###   Johnson-Lindenstrauss_Lemma, Li,Probability RandomProjection,
###   distribution sparse_matrix,

### ** Examples

# Load Library
library(RandPro)

# Default Gaussian projection matrix without JL transform
mat <- form_matrix(600,1000,FALSE)

# Default Gaussian projection matrix with JL transform of 50% Error tolerance
mat <- form_matrix(300,100000,TRUE,0.5)

# Projection matrix with probability distribution of 50% Error tolerance
mat <- form_matrix(250,1000000,TRUE,0.5,"probability")

# Projection matrix with li distribution of 50% Error tolerance
mat <- form_matrix(250,1000000,TRUE,0.5,"li")

# Projection matrix with achlioptas distribution of 50% Error tolerance
mat <- form_matrix(250,1000000,TRUE,0.5,"achlioptas")





