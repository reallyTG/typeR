library(wql)


### Name: eofNum
### Title: Plot EOF percent variance
### Aliases: eofNum
### Keywords: Graphics ts

### ** Examples


# Create an annual time series data matrix from sfbay chlorophyll data
# Average over each year
chla1 <- aggregate(sfbayChla, 1, mean, na.rm = TRUE)  
chla1 <- chla1[, 1:12]  # remove stations with missing years
eofNum(chla1)
# These stations appear to act as one with respect to chlorophyll
# variability on the annual scale because there's one dominant EOF.




