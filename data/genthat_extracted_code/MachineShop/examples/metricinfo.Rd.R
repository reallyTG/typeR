library(MachineShop)


### Name: metricinfo
### Title: Display Performance Metric Information
### Aliases: metricinfo

### ** Examples

## All metrics
metricinfo()

## Metrics by observed and predicted response types
names(metricinfo(factor(0)))
names(metricinfo(factor(0), factor(0)))
names(metricinfo(factor(0), matrix(0)))
names(metricinfo(factor(0), numeric(0)))




