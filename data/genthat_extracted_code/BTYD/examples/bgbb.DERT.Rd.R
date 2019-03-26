library(BTYD)


### Name: bgbb.DERT
### Title: BG/BB Discounted Expected Residual Transactions
### Aliases: bgbb.DERT bgbb.rf.matrix.DERT

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# Compute DERT for a customer who made 3 transactions
# in the calibration period(consisting of 6 transaction
# opportunities), with the last transaction occurring
# during the 4th transaction opportunity, discounted at
# 10%.
bgbb.DERT(params, x=3, t.x=4, n.cal=6, d=0.1)

# We can also compare DERT for several customers:
bgbb.DERT(params, x=1:6, t.x=6, n.cal=6, d=0.1)

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# compute DERT for a customer from every row in rf.matrix,
# discounted at 10%.
bgbb.rf.matrix.DERT(est.params, rf.matrix, d=0.1)



