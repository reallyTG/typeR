library(PCICt)


### Name: Ops.PCICt
### Title: Ops.PCICt
### Aliases: Ops.PCICt +.PCICt -.PCICt [.PCICt [<-.PCICt
### Keywords: ts

### ** Examples

## Create a list of PCICt of length 2 with a 365-day calendar
x <- as.PCICt(c("1961-09-02", "1963-02-01"), cal="365_day")

## Look at the difference between the two elements of x
y <- x[1] - x[2]

## Change the first element of x
x[1] <- as.PCICt("1962-09-02", cal="365_day")



