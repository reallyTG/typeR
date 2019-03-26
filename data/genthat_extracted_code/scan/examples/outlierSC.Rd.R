library(scan)


### Name: outlierSC
### Title: Handling outliers in single-case data
### Aliases: outlierSC
### Keywords: manip

### ** Examples

## Identify outliers using 1.5 standard deviations as criterion
susanne <- rSC(d.level = 1.0)
res <- outlierSC(susanne, criteria = c("SD", 1.5))
plotSC(susanne, marks = list(positions = res$dropped.mt))

## Identify outliers in the original data from Grosche (2011) using Cook's Distance
## greater than 4/n as criterion
res <- outlierSC(Grosche2011, criteria = c("Cook", "4/n"))
plotSC(Grosche2011, marks = list(positions = res$dropped.mt))



