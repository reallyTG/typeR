library(HRW)


### Name: carAuction
### Title: Cars purchased at auction
### Aliases: carAuction

### ** Examples

library(HRW) ; data(carAuction)
## Not run: 
##D for (colNum in 3:10) 
##D {
##D    plot(jitter(carAuction[,colNum]),jitter(carAuction$IsBadBuy),pch = ".",
##D         xlab = names(carAuction)[colNum],ylab = "is car a bad buy?",col = "blue")
##D    readline("Hit Enter to continue.\n")
##D }
##D for (colNum in 11:51) 
##D {
##D    plot(jitter(carAuction[,colNum]),jitter(carAuction$IsBadBuy),pch = ".",
##D         xlab = names(carAuction)[colNum],ylab = "is car a bad buy?",col = "blue")
##D    readline("Hit Enter to continue.\n")
##D }
## End(Not run)



