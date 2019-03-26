library(LendingClub)


### Name: lc_SubmitOrder
### Title: Buy a note on the primary market
### Aliases: lc_SubmitOrder

### ** Examples

## Not run: 
##D SubmitOrder(12345678, 25)
##D SubmitOrder(12345678, 25, "myPortfolio")
##D 
##D #For multiple loans in a single order
##D SubmitOrder(loanId=c(123, 456, 789), amount= c(rep(25,3)))
## End(Not run)



