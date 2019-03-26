library(Relatedness)


### Name: RelComb
### Title: Computation of Linear Combination of Relatedness Coefficients
### Aliases: RelComb
### Keywords: Relatedness Identifiability

### ** Examples

require('Relatedness')
data(Delta)
RelatednessComb <- RelComb(Combination='simple relatedness', Delta, ShowIdentifiable = TRUE)
print(RelatednessComb)



