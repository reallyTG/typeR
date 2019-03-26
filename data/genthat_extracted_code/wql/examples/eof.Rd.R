library(wql)


### Name: eof
### Title: Empirical orthogonal function analysis
### Aliases: eof
### Keywords: ts

### ** Examples


# Create an annual matrix time series
chla1 <- aggregate(sfbayChla, 1, mean, na.rm = TRUE)
chla1 <- chla1[, 1:12]  # remove stations with missing years
# eofNum (see examples) suggests n = 1
eof(chla1, 1)




