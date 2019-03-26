library(BTYD)


### Name: bgnbd.ConditionalExpectedTransactions
### Title: BG/NBD Conditional Expected Transactions
### Aliases: bgnbd.ConditionalExpectedTransactions

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)
# Number of transactions a customer is expected to make in 2 time
# intervals, given that they made 10 repeat transactions in a time period
# of 39 intervals, with the 10th repeat transaction occurring in the 35th
# interval.
bgnbd.ConditionalExpectedTransactions(params, T.star=2, x=10, t.x=35, T.cal=39)

# We can also compare expected transactions across different
# calibration period behaviors:
bgnbd.ConditionalExpectedTransactions(params, T.star=2, x=5:20, t.x=25, T.cal=39)



