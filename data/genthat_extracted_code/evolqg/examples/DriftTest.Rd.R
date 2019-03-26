library(evolqg)


### Name: DriftTest
### Title: Test drift hypothesis
### Aliases: DriftTest

### ** Examples


#Input can be an array with means in each row or a list of mean vectors
means = array(rnorm(40*10), c(10, 40)) 
cov.matrix = RandomMatrix(40, 1, 1, 10)
DriftTest(means, cov.matrix)



