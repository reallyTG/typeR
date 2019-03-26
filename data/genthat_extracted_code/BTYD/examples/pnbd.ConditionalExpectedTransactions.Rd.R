library(BTYD)


### Name: pnbd.ConditionalExpectedTransactions
### Title: Pareto/NBD Conditional Expected Transactions
### Aliases: pnbd.ConditionalExpectedTransactions

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)
# Number of transactions a customer is expected to make in 2 time
# intervals, given that they made 10 repeat transactions in a time period
# of 39 intervals, with the 10th repeat transaction occurring in the 35th
# interval.
pnbd.ConditionalExpectedTransactions(params, T.star=2, x=10, t.x=35, T.cal=39)

# We can also compare expected transactions across different
# calibration period behaviors:
pnbd.ConditionalExpectedTransactions(params, T.star=2, x=5:20, t.x=25, T.cal=39)



