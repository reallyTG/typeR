library(riskyr)


### Name: FDR
### Title: The false detection rate of a decision process or diagnostic
###   procedure.
### Aliases: FDR
### Keywords: datasets

### ** Examples

FDR <- .45     # => sets a false discovery rate (FDR) of 45%
FDR <- 45/100  # => (condition = FALSE) for 45 out of 100 people with (decision = positive)
is_prob(FDR)   # => TRUE (as FDR is a probability)



