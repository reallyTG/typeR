library(oce)


### Name: julianCenturyAnomaly
### Title: Julian-Day number to Julian century
### Aliases: julianCenturyAnomaly

### ** Examples


t <- ISOdatetime(1978, 11, 13, 4, 35, 0, tz="UTC")
jca <- julianCenturyAnomaly(julianDay(t))
cat(format(t), "is Julian Century anomaly", format(jca, digits=8), "\n")




