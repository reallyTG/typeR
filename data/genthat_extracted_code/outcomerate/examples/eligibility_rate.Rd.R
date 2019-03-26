library(outcomerate)


### Name: eligibility_rate
### Title: Survey Eligibility Rate
### Aliases: eligibility_rate

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
# NE = Not eligible
x <- c("I", "P", "I", "NE", "NC", "UH", "I", "R", "UO", "I", "O", "P", "I")

# calculate all rates, assume 80% of unknown cases are elligble
eligibility_rate(x)

# calculate weighted rates
w <- runif(13, 0, 5)
eligibility_rate(x, weight = w)

# alternatively, provide input as counts
freq <- c(I = 6, P = 2, NC = 3, NE = 1)
eligibility_rate(freq)




