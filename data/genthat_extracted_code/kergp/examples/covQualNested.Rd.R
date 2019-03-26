library(kergp)


### Name: covQualNested
### Title: Nested Qualitative Covariance
### Aliases: covQualNested

### ** Examples


### Ex 1. See the vignette "groupKernel" for an example 
###       inspired from computer experiments.

### Ex 2. Below an example in data analysis.

country <- c("B", "B", "B", "F", "F" ,"F", "D", "D", "D")
cities <- c("AntWerp", "Ghent" , "Charleroi", "Paris", "Marseille", "Lyon",
            "Berlin", "Hambourg", "Munchen")

## create a nested covariance. Note that it will be used with ONE factor
## input obtained by pasing the group and subgroup.

nest <- covQualNested(input = "ccities",
                      group = country, nestedLevels = cities,
                      between = "Symm", within = "Diag",
                      compGrad = TRUE,
                      covBet = "corr", covWith = "corr")

## 'show' method as automatically invocated
nest

## 'covMat' method: if provided, 'X' must be  a data frame with a
## suitable factor or integer column. The input name was given
## at the creation of the covariance structure

Z <- sample(levels(nest)[[1]], size = 30, replace = TRUE)
df <- data.frame(ccities = factor(Z))
covMat(nest, X = df)
covMat(nest)
## Not run: 
##D     if (require(corrplot)) corrplot(cov2cor(covMat(nest)))
## End(Not run)

## 'simulate' method. One can give a 'X' formal, but with no
## duplicated values!

Sim <- simulate(nest, nsim = 30)
levs <- levels(nest)[[1]]
matplot(Sim, type = "l", main = "Simulated paths", xaxt = "n")
axis(side = 1, at = seq_along(levs), labels = levs)

## another 'covMat'

cc <- as.factor(sample(paste(country, cities, sep = "/"),
                size = 100, replace = TRUE))
covMat(nest, X = data.frame(ccities = cc))




