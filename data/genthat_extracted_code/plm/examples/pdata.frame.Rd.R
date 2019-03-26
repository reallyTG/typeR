library(plm)


### Name: pdata.frame
### Title: data.frame for panel data
### Aliases: pdata.frame print.pdata.frame [.pdata.frame [[.pdata.frame
###   $.pdata.frame as.data.frame.pdata.frame as.list.pdata.frame
### Keywords: classes

### ** Examples

# Gasoline contains two variables which are individual and time indexes
data("Gasoline", package = "plm")
Gas <- pdata.frame(Gasoline, index = c("country", "year"), drop.index = TRUE)

# Hedonic is an unbalanced panel, townid is the individual index
data("Hedonic", package = "plm")
Hed <- pdata.frame(Hedonic, index = "townid", row.names = FALSE)

# In case of balanced panel, it is sufficient to give number of individuals 
# data set 'Wages' is organized as a stacked time series
data("Wages", package = "plm")
Wag <- pdata.frame(Wages, 595)

# lapply on a pdata.frame by making it a list of pseries first
lapply(as.list(Wag[ , c("ed", "lwage")], keep.attributes = TRUE), lag)




