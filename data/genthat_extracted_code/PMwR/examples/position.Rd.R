library(PMwR)


### Name: position
### Title: Aggregate Transactions to Positions
### Aliases: position position.default position.journal print.position
###   as.matrix.position

### ** Examples

position(amount = c(1, 1, -1, 3, -4), timestamp = 1:5, when = 4.9)

## using a journal
J <- journal(timestamp = 1:5, amount = c(1, 1, -1, 3, -4))
position(J, when = 4.9)



