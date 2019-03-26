library(EMP)


### Name: EMP-package
### Title: Expected Maximum Profit Classification Performance Measure
### Aliases: EMP-package EMP

### ** Examples

# Construct artificial probability scores and true class labels
score.ex <- runif(1000, 0, 1)
class.ex <- unlist(lapply(score.ex, function(x){rbinom(1,1,x)}))

# Calculate EMP measures for credit risk scoring
empCreditScoring(score.ex, class.ex)

# Calculate EMP measures for customer churn prediction
empChurn(score.ex, class.ex)



