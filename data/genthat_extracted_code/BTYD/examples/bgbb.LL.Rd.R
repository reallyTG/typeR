library(BTYD)


### Name: bgbb.LL
### Title: BG/BB Log-Likelihood
### Aliases: bgbb.LL bgbb.rf.matrix.LL

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

params <- c(1.20, 0.75, 0.66, 2.78)
bgbb.rf.matrix.LL(params, rf.matrix)

# Returns the log likelihood of the parameters for a customer who
# made 3 transactions in a calibration period with 6 transaction opportunities,
# with the last transaction occurring during the 4th transaction opportunity.
bgbb.LL(params, x=3, t.x=4, n.cal=6)

# We can also give vectors as function parameters:
set.seed(7)
x <- sample(1:3, 10, replace = TRUE)
t.x <- sample(3:5, 10, replace = TRUE)
n.cal <- rep(5, 10)
bgbb.LL(params, x, t.x, n.cal)



