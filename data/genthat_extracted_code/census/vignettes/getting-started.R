## ----set-options, warning=FALSE, message=FALSE---------------------------
library(census)

# City level data for Chicago and New York
radius <- 5
cities <- c("Chicago, IL", "New York")
df <- getCensus(cities, radius)
df[1:2, c("sitename","radius","TotPop","pctMales","pctFemales","AvgFamInc","pctPrivWageWorkers","pctGovWorkers", "pctMarried","pctBachelors","MedianHValue")]

