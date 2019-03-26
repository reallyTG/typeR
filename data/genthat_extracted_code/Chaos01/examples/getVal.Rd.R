library(Chaos01)


### Name: getVal
### Title: Get the vector of Kc/c values from the chaos01.res object.
### Aliases: getVal
### Keywords: chaos results test

### ** Examples

vec.x <- gen.logistic(mu = 3.55, iter = 2000)

#Kc for each value of c
res2 <- testChaos01(vec.x, out = TRUE)

results <- getVal(res2, vars = "both")
print(head(results))

#Get results of 0-1 test for Chaos when out = TRUE
K <- median(getVal(res2, vars = "Kc"))



