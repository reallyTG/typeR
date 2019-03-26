library(BTYD)


### Name: bgbb.ConditionalExpectedTransactions
### Title: BG/BB Conditional Expected Transactions
### Aliases: bgbb.ConditionalExpectedTransactions

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# the number of transactions a customer is expected
# to make in the 10 transaction opportunities
# following the calibration period, which consisted
# of 6 transaction opportunities (during which they
# made 3 transactions, the last of which occurred
# in the 4th opportunity)
bgbb.ConditionalExpectedTransactions(params, n.cal=6, n.star=10, x=3, t.x=4)

# We can also use vectors as input:
bgbb.ConditionalExpectedTransactions(params, n.cal=6, n.star=1:10, x=3, t.x=4)
bgbb.ConditionalExpectedTransactions(params, n.cal=6, n.star=10, x=1:4, t.x=4)



