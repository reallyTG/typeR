library(PMwR)


### Name: btest
### Title: Backtesting Investment Strategies
### Aliases: btest

### ** Examples

## For more examples, please see then Manual
## http://enricoschumann.net/R/packages/PMwR/manual/PMwR.html

## 1 - a simple rule
timestamp <- structure(c(16679L, 16680L, 16681L, 16682L, 
                         16685L, 16686L, 16687L, 16688L, 
                         16689L, 16692L, 16693L), 
                       class = "Date")
prices <- c(3182, 3205, 3272, 3185, 3201, 
            3236, 3272, 3224, 3194, 3188, 3213)
data.frame(timestamp, prices)


signal <- function()     ## buy when last price is 
    if (Close() < 3200)  ## below 3200, else sell
        1 else 0         ## (more precisely: build position of 1
                         ##  when price < 3200, else reduce
                         ##  position to 0)

solution <- btest(prices = prices, signal = signal)
journal(solution)


## with Date timestamps
solution <- btest(prices = prices, signal = signal,
                  timestamp = timestamp)
journal(solution)



## 2 - a simple MA model
## Not run: 
##D library("PMwR")
##D library("NMOF")
##D 
##D dax <- DAX[[1]]
##D 
##D n <- 5
##D ma <- MA(dax, n, pad = NA)
##D 
##D ma_strat <-  function(ma) {
##D     if (Close() > ma[Time()])
##D         1
##D     else
##D         0
##D }
##D 
##D 
##D plot(as.Date(row.names(DAX)), dax, type = "l", xlab = "", ylab = "DAX")
##D lines(as.Date(row.names(DAX)), ma, type = "l")
##D 
##D res <- btest(dax, signal = ma_strat,
##D              b = n, ma = ma)
##D 
##D par(mfrow = c(3,1))
##D plot(as.Date(row.names(DAX)), dax, type = "l",
##D      xlab = "", ylab = "DAX")
##D plot(as.Date(row.names(DAX)), res$wealth, type = "l",
##D      xlab = "", ylab = "Equity")
##D plot(as.Date(row.names(DAX)), position(res), type = "s",
##D      xlab = "", ylab = "Position")
## End(Not run)



