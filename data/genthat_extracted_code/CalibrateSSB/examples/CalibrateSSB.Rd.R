library(CalibrateSSB)


### Name: CalibrateSSB
### Title: Calibration weighting and estimation
### Aliases: CalibrateSSB

### ** Examples


# Generates data  - two years
z    <- AkuData(3000)  # 3000 in each quarter
zPop <- AkuData(10000)[,1:7]

# Calibration using "survey"
a <- CalibrateSSB(z, calmodel = "~ sex*age",
                 partition = c("year","q"),  # calibrate within quarter
                 popData = zPop, y = c("unemployed","workforce"),
                 by = c("year","q")) # Estimate within quarter
head(a$w) # calibrated weights
a$estTM   # estimates
a$popTotals   # popTotals used as input below


# Calibration, no package, popTotals as input
b <- CalibrateSSB(z, popTotals=a$popTotals, calmodel="~ sex*age",
      partition = c("year","q"), usePackage = "none", y = c("unemployed","workforce"))
max(abs(a$w-b$w)) # Same weights as above

print(a)
print(b)





