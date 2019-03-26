library(openair)


### Name: trendLevel
### Title: trendLevel
### Aliases: trendLevel
### Keywords: methods

### ** Examples



#basic use
#default statistic = "mean"
trendLevel(mydata, pollutant = "nox")

#applying same as 'own' statistic
my.mean <- function(x) mean(x, na.rm = TRUE)
trendLevel(mydata, pollutant = "nox", statistic = my.mean)

#alternative for 'third party' statistic
#trendLevel(mydata, pollutant = "nox", statistic = mean,
#           stat.args = list(na.rm = TRUE))

## Not run: 
##D # example with categorical scale
##D trendLevel(mydata, pollutant = "no2",
##D border = "white", statistic = "max",
##D breaks = c(0, 50, 100, 500),
##D labels = c("low", "medium", "high"),
##D cols = c("forestgreen", "yellow", "red"))
## End(Not run)





