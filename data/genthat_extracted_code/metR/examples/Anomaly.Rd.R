library(metR)


### Name: Anomaly
### Title: Anomalies
### Aliases: Anomaly

### ** Examples

# Zonal temperature anomaly
library(data.table)
temperature[, .(lon = lon, air.z = Anomaly(air)), by = .(lat, lev)]




