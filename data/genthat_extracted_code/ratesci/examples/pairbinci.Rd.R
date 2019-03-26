library(ratesci)


### Name: pairbinci
### Title: Confidence intervals for comparisons of paired binomial rates.
### Aliases: pairbinci

### ** Examples

  #Data example from Agresti-Min 2005
  pairbinci(x = c(53,16,8,9), contrast="RD", method_RD="Score")
  pairbinci(x = c(53,16,8,9), contrast="RD", method_RD="TDAS")
  pairbinci(x = c(53,16,8,9), contrast="RR", method_RR="Score")
  pairbinci(x = c(53,16,8,9), contrast="RR", method_RR="TDAS")
  pairbinci(x = c(53,16,8,9), contrast="OR", method_OR="SCAS")



