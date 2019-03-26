library(imaginator)


### Name: ClaimsByLinkRatio
### Title: Claims by link ratio
### Aliases: ClaimsByLinkRatio

### ** Examples


dfPolicy <- NewPolicyYear(10, 2001)
dfClaims <- ClaimsByFirstReport(
               dfPolicy
             , Frequency = FixedHelper(10)
             , PaymentSeverity = FixedHelper(100)
             , Lags = 1)
dfClaims <- ClaimsByLinkRatio(dfClaims
                              , Links = FixedHelper(c(1.25, 1.1, 1.05))
                              , Lags = 1:4)




