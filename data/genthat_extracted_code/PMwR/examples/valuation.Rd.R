library(PMwR)


### Name: valuation
### Title: Valuation
### Aliases: valuation valuation.journal valuation.position

### ** Examples

j <- journal(amount = 10, price = 2)
##    amount  price
## 1      10      2
##
## 1 transaction

valuation(j, instrument = NA)
##    amount  price
## 1     -20      1
##
## 1 transaction



