library(dispRity)


### Name: dtt.dispRity
### Title: dtt dispRity (from 'geiger::dtt')
### Aliases: dtt.dispRity

### ** Examples

## Loading geiger's example data set
require(geiger)
geiger_data <- get(data(geospiza))

## Calculate the disparity of the dataset using dtt::geiger
geiger_dtt <- dtt(phy = geiger_data$phy, data = geiger_data$dat, nsim = 100)

## The average squared pairwise distance metric (used in geiger::dtt)
average.sq <- function(X) mean(pairwise.dist(X)^2)

## Calculate the disparity of the dataset using dtt.dispRity
dispRity_dtt <- dtt.dispRity(data = geiger_data$dat, metric = average.sq,
                             tree = geiger_data$phy, nsim = 100)

## Plotting the results
plot(dispRity_dtt)

## Disparity values are identical up to the 9th digit!
round(geiger_dtt$dtt, 9) == round(dispRity_dtt$dtt, 9)
 
## Calculate disparity with a different metric using dtt.dispRity
dispRity_dtt2 <- dtt.dispRity(data = geiger_data$dat, tree = geiger_data$phy,
                             metric = c(median, centroids), nsim = 50)
plot(dispRity_dtt2)




