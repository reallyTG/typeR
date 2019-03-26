library(EpiStats)


### Name: CS
### Title: Univariate analysis of cohort study measuring risk
### Aliases: CS cs
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(EpiStats)

# Dataset by Anja Hauri, RKI.
# Dataset provided with package.
data(Tiramisu)
DF <- Tiramisu

# The CS command looks at the association between the outcome variable "ill"
# and an exposure "mousse"
CS(DF, "ill", "mousse")

# The option exact = TRUE provides Fisher's exact test p-values
CS(DF, "ill", "mousse", exact = TRUE)

# With the option full = TRUE you can easily use individual elements of the results:
result <- CS(DF, "ill", "mousse", full = TRUE)
result$st$risk_ratio$point_estimate




