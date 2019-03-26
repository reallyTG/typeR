library(psychometric)


### Name: Utility
### Title: Marginal and Total Utility of a Test
### Aliases: Utility MargUtil TotUtil
### Keywords: univar

### ** Examples

# Rxy = .35
# Each year 72 workers are hired
# SD of performance in dollars is $4000
# 1 out of 10 applicants are selected
# cost per test = $5
# average test score for those selected = 1.76
MargUtil(.35, 4000, 1.76, 720*5, 72)
TotUtil (.35, 4000, 1.76, 720*5, 72)



