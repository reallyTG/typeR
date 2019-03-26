library(generalCorr)


### Name: allPairs
### Title: Report causal identification for all pairs of variables in a
###   matrix.
### Aliases: allPairs
### Keywords: absolute amorphous derivative, dominance partial residuals,
###   stochastic

### ** Examples


data(mtcars)
for(j in 1:3){
a1=allPairs(mtcars[,1:3], typ=j)
print(a1)}




