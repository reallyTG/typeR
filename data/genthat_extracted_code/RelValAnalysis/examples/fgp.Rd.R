library(RelValAnalysis)


### Name: fgp
### Title: Functionally Generated Portfolio Objects
### Aliases: fgp

### ** Examples

# Example 1: The diversity-weighted portfolio with p = 0.5
# This has the same effect has DiversityPortfolio(p = 0.5)
my.portfolio <- fgp("Diversity-Weighted Portfolio, p = 0.5",
                    function(x) (sum(sqrt(x)))^2,
                    function(x) sqrt(x) / sum(sqrt(x)))
                    
                    
# Example 2: A quadratic Gini coefficient
# See Example 3.4.7 of Fernholz (2002)

# Generating function
gen.function <- function(x) {
  n <- length(x)
  return(1 - sum((x - 1/n)^2)/2)
}

# Weight function
weight.function <- function(x) {
  n <- length(x)
  S <- gen.function(x) 
  return(((1/n - x)/S + 1 - sum(x*(1/n - x)/S))*x)
}

# Define fgp object
my.portfolio <- fgp("Quadratic Gini",
                    gen.function, weight.function)

# Its performance in the apple-starbucks market
data(applestarbucks)
market <- toymkt(applestarbucks)
result <- FernholzDecomp(market, my.portfolio, plot = TRUE)




