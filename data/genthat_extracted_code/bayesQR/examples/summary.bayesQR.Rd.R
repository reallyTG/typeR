library(bayesQR)


### Name: summary.bayesQR
### Title: Summarize the output of the 'bayesQR' function
### Aliases: summary.bayesQR

### ** Examples

# Load the Prostate cancer dataset
data(Churn)

# Estimate the model parameters with default prior
out <- bayesQR(churn~gender+recency, data=Churn, ndraw=5000)

# Return Bayes estimates and credible intervals 
sum <- summary(out, burnin=1000)

# Inspect structure of bayesQR.summary object
str(sum)

# Print bayesQR.summary object
sum



