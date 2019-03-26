library(EMP)


### Name: empChurn
### Title: empChurn
### Aliases: empChurn
### Keywords: classif evaluation

### ** Examples

# Construct artificial probability scores and true class labels
score.ex <- runif(1000, 0, 1)
class.ex <- unlist(lapply(score.ex, function(x){rbinom(1,1,x)}))

# Calculate EMP measures for customer churn prediction
empChurn(score.ex, class.ex)

# Calculate EMP measures for customer churn prediction with
# lower clv and higher costs
empChurn(score.ex, class.ex, clv = 100, d = 30, f = 5)



