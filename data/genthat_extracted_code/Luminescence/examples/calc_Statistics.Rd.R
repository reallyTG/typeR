library(Luminescence)


### Name: calc_Statistics
### Title: Function to calculate statistic measures
### Aliases: calc_Statistics
### Keywords: datagen

### ** Examples


## load example data
data(ExampleData.DeValues, envir = environment())

## show a rough plot of the data to illustrate the non-normal distribution
plot_KDE(ExampleData.DeValues$BT998)

## calculate statistics and show output
str(calc_Statistics(ExampleData.DeValues$BT998))

## Not run: 
##D ## now the same for 10000 normal distributed random numbers with equal errors
##D x <- as.data.frame(cbind(rnorm(n = 10^5, mean = 0, sd = 1),
##D                          rep(0.001, 10^5)))
##D 
##D ## note the congruent results for weighted and unweighted measures
##D str(calc_Statistics(x))
## End(Not run)




