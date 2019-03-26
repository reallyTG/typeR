library(Luminescence)


### Name: plot_FilterCombinations
### Title: Plot filter combinations along with the (optional) net
###   transmission window
### Aliases: plot_FilterCombinations
### Keywords: aplot datagen

### ** Examples


## (For legal reasons no real filter data are provided)

## Create filter sets
filter1 <- density(rnorm(100, mean = 450, sd = 20))
filter1 <- matrix(c(filter1$x, filter1$y/max(filter1$y)), ncol = 2)
filter2 <- matrix(c(200:799,rep(c(0,0.8,0),each = 200)), ncol = 2)

## Example 1 (standard)
plot_FilterCombinations(filters = list(filter1, filter2))

## Example 2 (with d and P value and name for filter 2)
results <- plot_FilterCombinations(
filters = list(filter_1 = filter1, Rectangle = list(filter2, d = 2, P = 0.6)))
results

## Example 3 show optical density
plot(results$OD_total)

## Not run: 
##D ##Example 4
##D ##show the filters using the interactive mode
##D plot_FilterCombinations(filters = list(filter1, filter2), interactive = TRUE)
##D 
## End(Not run)





