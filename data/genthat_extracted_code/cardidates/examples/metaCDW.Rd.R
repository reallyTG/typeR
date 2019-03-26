library(cardidates)


### Name: metaCDW
### Title: Extract Cardinal Dates of Multiple Time Series at Once Using
###   Fitted Weibull Curves
### Aliases: metaCDW summary.cardiMetacdw
### Keywords: misc optimize

### ** Examples


## open test data set (3 years) with 4 columns
## sample, x, y, flag
data(carditest)
dat <- carditest

## alternatively: import data from spreadsheet via the clipboard
# dat <- read.table("clipboard", sep = "\t", header = TRUE)

## or, for languages with comma as decimal separator:
# dat <- read.table("clipboard", sep = "\t", header = TRUE, dec = ",")

## Note: as.numeric recodes factor year to numeric value
plot(as.numeric(dat$sample)*365 + dat$x, dat$y, type = "b")

## do the analysis
tt <- metaCDW(dat, xstart = 55)

## plot results
par(mfrow=c(1, 3))
lapply(tt$weibullfits, plot)

## return table of results
summary(tt)

## Not run: 
##D ## copy to clipboard in spreadsheet compatible format
##D summary(tt, file = "clipboard", sep = "\t", quote = FALSE, row.names = FALSE)
##D 
##D ## or, for languages with comma as decimal separator:
##D #summary(tt, file = "clipboard", sep = "\t", dec = ",",
##D #  quote = FALSE, row.names = FALSE)
## End(Not run)



