library(imaginator)


### Name: ClaimsByFirstReport
### Title: Claims by first report
### Aliases: ClaimsByFirstReport

### ** Examples


# This will generate a claim data frame which has 1,000 records
# each of which has a severity of 100
dfPolicy <- NewPolicyYear(100, 2001)
dfClaims <- ClaimsByFirstReport(
               dfPolicy
             , Frequency = FixedHelper(10)
             , PaymentSeverity = FixedHelper(100)
             , Lags = 1)




