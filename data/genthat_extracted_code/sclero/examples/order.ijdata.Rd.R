library(sclero)


### Name: order.ijdata
### Title: Order IJDATA spot sequences and growth lines
### Aliases: order.ijdata

### ** Examples

data(shellspots)
order.ijdata(shellspots, print.order = TRUE) # Prints the current order. Does not change anything
dat <- order.ijdata(shellspots, gbs = c(1,3,6:14,4,5,2)) # Changes order of growth bands
order.ijdata(dat, print.order = TRUE)

## Subset the first sample spot sequence
dat2 <- order.ijdata(shellspots, gbs = 1:13)
## Warning message:
## In order.ijdata(shellspots, gbs = 1:13) :
## Length of gbs does not correspond the number of columns. Data removed.
order.ijdata(dat2, print.order = TRUE)



