library(PMwR)


### Name: journal
### Title: Journal
### Aliases: journal aggregate.journal all.equal.journal as.journal
###   c.journal head.journal is.journal journal.default length.journal
###   print.journal sort.journal split.journal subset.journal
###   summary.journal tail.journal [.journal [<-.journal
###   as.data.frame.journal

### ** Examples

j <- journal(timestamp = 1:3,
             amount = c(1,2,3),
             price = 101:103,
             instrument = c("Stock A", "Stock A", "Stock B"))

## *** subset *** in functions
##   this should work as expected ...
t0 <- 2.5                         
subset(j, timestamp > t0)

##   ... but here?!
tradesAfterT <- function(j, t0)   
    subset(j, timestamp > t0)        
tradesAfterT(j, 0)               

##   if really required
tradesAfterT <- function(j, t0) {
    e <- substitute(timestamp > t0, list(t0 = t0))
    do.call(subset, list(j, e))
}
tradesAfterT(j, 0)

##   ... or much simpler
tradesAfterT <- function(j, t0)
    j[j$timestamp > t0]
tradesAfterT(j, 0)

## *** aggregate ***
##   several buys and sells on two days
##   aim: find average buy/sell price per day
j <- journal(timestamp = structure(c(15950, 15951, 15950, 15951, 15950,
                                     15950, 15951, 15951, 15951, 15951),
                                   class = "Date"),
             amount = c(-3, -4, -3, -1, 3, -2, 1, 3, 5, 3),
             price = c(104, 102, 102, 110, 106, 104, 104, 106, 108, 107),
             instrument = c("B", "B", "A", "A", "B", "B", "A", "B", "A", "A"))

by <- list(j$instrument, sign(j$amount), as.Date(j$timestamp))
fun <- function(x) {
    journal(timestamp = as.Date(x$timestamp[1]),
            amount = sum(x$amount),
            price = sum(x$amount*x$price)/sum(x$amount),
            instrument = x$instrument[1L])
}
aggregate(j, by = by, FUN = fun)




