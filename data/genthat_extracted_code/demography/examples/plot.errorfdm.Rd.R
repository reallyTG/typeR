library(demography)


### Name: plot.errorfdm
### Title: Plot differences between actuals and estimates from fitted
###   demographic model
### Aliases: plot.errorfdm
### Keywords: hplot

### ** Examples

fr.fit <- lca(extract.years(fr.mort,years=1921:1980))
fr.error <- compare.demogdata(fr.mort, forecast(fr.fit,20))
plot(fr.error)



