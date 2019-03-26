library(discharge)


### Name: compare.periods
### Title: Compare residual variability across time periods
### Aliases: compare.periods plot.compflows

### ** Examples

# load data
data("sycamore")

# compare for periods from 1960 to 1979 and 1980 to 1999
compare.periods(c("1960-01-01", "1979-12-31"), 
c("1980-01-01", "1999-12-31"), sycamore)



