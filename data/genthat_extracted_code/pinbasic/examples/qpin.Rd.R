library(pinbasic)


### Name: qpin
### Title: Quarterly PIN estimates
### Aliases: qpin

### ** Examples

# Loading one year of simulated daily buys and sells

data('BSfrequent2015')

# Quarterly estimates for model parameters and the probability of informed trading
# Rownames of 'BSfrequent2015' equal the business days in 2015.

qpin2015 <- qpin(numbuys = BSfrequent2015[,"Buys"],
                 numsells = BSfrequent2015[,"Sells"],
                 dates = as.Date(rownames(BSfrequent2015), format = "%Y-%m-%d"))



