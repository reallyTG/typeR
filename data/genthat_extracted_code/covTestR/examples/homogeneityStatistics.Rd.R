library(covTestR)


### Name: Ahmad2017
### Title: Tests for Homogeneity of Covariance Matrices
### Aliases: Ahmad2017 BoxesM Chaipitak2013 homogeneityStatistics Ishii2016
###   Schott2001 Schott2007 Srivastava2007 Srivastava2014
###   SrivastavaYanagihara2010

### ** Examples

irisSpecies <- unique(iris$Species)

iris_ls <- lapply(irisSpecies, 
    function(x){as.matrix(iris[iris$Species == x, 1:4])}
                 )
                 
names(iris_ls) <- irisSpecies

Ahmad2017(iris_ls)



