library(QCA)


### Name: findTh
### Title: Find calibration thresholds
### Aliases: findTh
### Keywords: functions

### ** Examples


# hypothetical list of country GDPs
gdp <- c(460, 500, 900, 2000, 2100, 2400, 15000, 16000, 20000)


# find one threshold to separate into two groups
findTh(gdp)
# 8700


# find two thresholds to separate into two groups
findTh(gdp, n = 2)
# 8700 18000


# using different clustering methods
findTh(gdp, n = 2, hclustm = "ward.D2", distm = "canberra")
# 1450 8700




