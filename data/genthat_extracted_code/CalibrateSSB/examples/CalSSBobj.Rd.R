library(CalibrateSSB)


### Name: CalSSBobj
### Title: Create or modify a CalSSB object
### Aliases: CalSSBobj

### ** Examples

#' # Generates data - two years
z <- AkuData(3000)  # 3000 in each quarter
zPop <- AkuData(10000)[, 1:7]

# Create a CalSSB object by CalibrateSSB
b <- CalibrateSSB(z, calmodel = "~ sex*age", partition = c("year", "q"), popData = zPop, 
                  y = c("unemployed", "workforce"))

# Modify the CalSSB object
a <- CalSSBobj(b, w = 10*b$w, wave = CrossStrata(z[, c("year", "q")]), id = z$id)

# Use the CalSSB object as input ...
PanelEstimation(WideFromCalibrate(a), "unemployed", linComb = PeriodDiff(8, 4))

# Create CalSSB object without x as input
CalSSBobj(y = b$y, w = 10*b$w, resids = b$resids, wave = CrossStrata(z[, c("year", "q")]), 
          id = z$id)




