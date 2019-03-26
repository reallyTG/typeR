library(analogue)


### Name: optima
### Title: Weighted averaging optima and tolerance ranges
### Aliases: optima optima.default print.optima print.tolerance
###   tolerance.default as.data.frame.optima as.data.frame.tolerance
### Keywords: methods

### ** Examples

## Load the Imbrie & Kipp data and
## summer sea-surface temperatures
data(ImbrieKipp)
data(SumSST)

## WA optima
(opt <- optima(ImbrieKipp, SumSST))

## WA tolerances
(tol <- tolerance(ImbrieKipp, SumSST, useN2 = TRUE))

## caterpillar plot
caterpillarPlot(opt, tol)

## convert to data frame
as.data.frame(opt)
as.data.frame(tol)

## bootstrap WA optima - 100 resamples too low for SD & pCI
bopt <- optima(ImbrieKipp, SumSST, boot = TRUE, nboot = 100)
head(bopt)




