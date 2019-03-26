library(Ecfun)


### Name: as.Date1970
### Title: Date from a number of days since the start of 1970.
### Aliases: as.Date1970
### Keywords: manip

### ** Examples

days <- c(0, 1, 365)
Dates <- as.Date1970(days)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(c('1970-01-01', '1970-01-02', '1971-01-01'),
          as.character(Dates))
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(days, as.numeric(Dates))
## Don't show: 
)
## End(Don't show)




