library(dispRity)


### Name: plot.dispRity
### Title: dispRity object plotting
### Aliases: plot.dispRity

### ** Examples

## Load the disparity data based on Beck & Lee 2014
data(disparity)

## Discrete plotting
plot(disparity, type = "box")

## Using polygons rather than boxes (quantiles and central tendency can be
## set by the user)
plot(disparity, type = "polygon", quantiles = c(10, 50, 95),
     cent.tend = mean)

## Using different options
plot(disparity, type = "line", elements = TRUE, ylim = c(0, 5),
     xlab = ("Time (Ma)"), ylab = "disparity")

## Continuous plotting (all default options)
plot(disparity, type = "continuous")

## Using different options (with non time.slicing option)
plot(disparity, type = "continuous", chrono.subsets = FALSE,
     elements = TRUE, col = c("red", "orange", "yellow"))

## Rarefactions plots
plot(disparity, rarefaction = TRUE)

## Not run: 
##D ## Geoscale plots
##D require(geoscale)
##D 
##D ## Converting the data into a list
##D data_obs <- extract.dispRity(disparity, observed = TRUE)
##D data_distribution <- extract.dispRity(disparity, observed = FALSE)
##D ## Removing one list level
##D data_distribution <- unlist(data_distribution, recursive = FALSE)
##D data_obs <- as.vector(data_obs)
##D 
##D ## Getting the ages
##D ages <- as.numeric(names(disparity$subsets))
##D 
##D ## Plotting the results median
##D geoscalePlot(ages, data_obs, boxes = "Age", data.lim = c(1.5, 2), type = "l")
##D 
##D ## Plotting the results distribution
##D geoscaleBox(data_distribution, ages, boxes = "Age", data.lim = c(1.5, 2))
## End(Not run)





