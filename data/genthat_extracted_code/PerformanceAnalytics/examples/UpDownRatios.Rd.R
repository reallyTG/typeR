library(PerformanceAnalytics)


### Name: UpDownRatios
### Title: calculate metrics on up and down markets for the benchmark asset
### Aliases: UpDownRatios

### ** Examples


data(managers)
UpDownRatios(managers[,1, drop=FALSE], managers[,8, drop=FALSE])
UpDownRatios(managers[,1:6, drop=FALSE], managers[,8, drop=FALSE])
UpDownRatios(managers[,1, drop=FALSE], managers[,8, drop=FALSE], method="Capture")
# Up Capture:
UpDownRatios(managers[,1, drop=FALSE], managers[,8, drop=FALSE], side="Up", method="Capture")
# Down Capture:
UpDownRatios(managers[,1, drop=FALSE], managers[,8, drop=FALSE], side="Down", method="Capture")




