library(EMP)


### Name: empCreditScoring
### Title: empCreditScoring
### Aliases: empCreditScoring
### Keywords: classif evaluation

### ** Examples

# Construct artificial probability scores and true class labels
score.ex <- runif(1000, 0, 1)
class.ex <- unlist(lapply(score.ex, function(x){rbinom(1,1,x)}))

# Calculate EMP measures for credit risk scoring
empCreditScoring(score.ex, class.ex)

# Calculate EMP measures for credit risk scoring with point masses
# in 0.1 and 0.9, and 0.1 ROI
empCreditScoring(score.ex, class.ex, 0.1, 0.1, 0.1)



