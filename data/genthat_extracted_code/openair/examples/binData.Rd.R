library(openair)


### Name: binData
### Title: Bin data, calculate mean and bootstrap 95% confidence interval
###   in the mean
### Aliases: binData

### ** Examples

# how does nox vary by intervals of wind speed?
results <- binData(mydata, bin = "ws", uncer = "nox")

# easy to plot this using ggplot2
## Not run: 
##D library(ggplot2)
##D ggplot(results, aes(ws, mean, ymin = min, ymax = max)) +
##D geom_pointrange()
##D 
## End(Not run)



