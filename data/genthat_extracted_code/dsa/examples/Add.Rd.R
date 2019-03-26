library(dsa)


### Name: Add
### Title: Adding xts together
### Aliases: Add

### ** Examples

series1 <- xts::xts(rnorm(5, 5, 5), seq.Date(from=as.Date("2010-01-01"), length.out=5, by="days"))
series2 <- xts::xts(c(3,4,NA, 6,7), seq.Date(from=as.Date("2010-01-01"), length.out=5, by="days"))
Add(series1, series2)
# Compare this to:
series1 + series2



