library(pinbasic)


### Name: ggplot.qpin
### Title: PIN Visualization
### Aliases: ggplot.qpin

### ** Examples

# Loading one year of simulated daily buys and sells

data('BSfrequent2015')

# Quarterly estimates for model parameters and the probability of informed trading
# Rownames of 'BSfrequent2015' equal the business days in 2015.

qpin_list <- qpin(numbuys = BSfrequent2015[,"Buys"], numsells = BSfrequent2015[,"Sells"],
                  dates = as.Date(rownames(BSfrequent2015), format = "%Y-%m-%d"))

# Visualization of quarterly estimates
library(ggplot2)
ggplot(qpin_list[["res"]])




