library(EpiStats)


### Name: CC
### Title: Univariate analysis of case control studies
### Aliases: CC cc
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(EpiStats)

# Dataset by Anja Hauri, RKI.
data(Tiramisu)
DF <- Tiramisu

# The CC command looks at the association between the outcome variable "ill" 
# and an exposure "mousse"

CC(DF, "ill", "mousse")

# The option exact = TRUE provides Fisher's exact test p-values
CC(DF, "ill", "mousse", exact = TRUE)

# With the option full = TRUE you can easily use individual elements of the results:
result <- CC(DF, "ill", "mousse", full = TRUE)
result$st$odds_ratio$point_estimate




