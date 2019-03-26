library(tailDepFun)


### Name: dataEUROSTOXX
### Title: EUROSTOXX50 weekly negative log-returns.
### Aliases: dataEUROSTOXX

### ** Examples

data(dataEUROSTOXX)
## Transform data to unit Pareto margins
n <- nrow(dataEUROSTOXX)
x <- apply(dataEUROSTOXX, 2, function(i) n/(n + 0.5 - rank(i)))
## Define indices in which we evaluate the estimator
indices <- selectGrid(c(0,0.5,1), d = 10, nonzero = c(2,3))
start <- c(0.67,0.8,0.77,0.91,0.41,0.47,0.25,0.7,0.72,0.19,0.37,0.7,0.09,0.58)
## Estimate the parameters. Lasts up to ten minutes.
## EstimationMaxLinear(x, indices, k = 40, method = "WLS", startingValue = start,
## covMat = FALSE, EURO = TRUE)



