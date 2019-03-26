library(BTYD)


### Name: pnbd.DERT
### Title: Pareto/NBD Discounted Expected Residual Transactions
### Aliases: pnbd.DERT

### ** Examples

params <- c(0.5629966, 12.5590370, 0.4081095, 10.5148048)

# 15% compounded annually has been converted to 0.0027 compounded continuously,
# as we are dealing with weekly data and not annual data.
d <- 0.0027

# calculate the discounted expected residual transactions of a customer
# who made 7 transactions in a calibration period that was 77.86
# weeks long, with the last transaction occurring at the end of
# the 35th week.
pnbd.DERT(params, x=7, t.x=35, T.cal=77.86, d)

# We can also use vectors to compute DERT for several customers:
pnbd.DERT(params, x=1:10, t.x = 30, T.cal=77.86, d)



