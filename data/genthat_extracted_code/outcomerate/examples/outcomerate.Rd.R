library(outcomerate)


### Name: outcomerate
### Title: AAPOR Survey Outcome Rates
### Aliases: outcomerate

### ** Examples

# load the outcomerate package
library(outcomerate)

# Create a vector of survey dispositions
#
# I  = Complete interview
# P  = Partial interview
# R  = Refusal and break-off
# NC = Non-contact
# O  = Other
# UH = Unknown if household/occupied housing unit
# UO = Unknown, other
# NE = Known ineligible
x <- c("I", "P", "I", "NC", "UH", "I", "R", "NE",
      "UO", "I", "O", "P", "I")

# calculate all rates
elr <- eligibility_rate(x)
outcomerate(x, e = elr)

# return only one rate
outcomerate(x, rate = "COOP1")

# calculate weighted rates
w <- runif(length(x), 0, 5)
outcomerate(x, e = elr, weight = w)

# alternatively, provide input as counts
freq <- c(I = 6, P = 2, NC = 3, R = 1)
outcomerate(freq, e = elr)



