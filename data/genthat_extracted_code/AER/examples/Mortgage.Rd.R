library(AER)


### Name: Mortgage
### Title: Fixed versus Adjustable Mortgages
### Aliases: Mortgage
### Keywords: datasets

### ** Examples

data("Mortgage")
plot(rate ~ interest, data = Mortgage, breaks = fivenum(Mortgage$interest))
plot(rate ~ margin, data = Mortgage, breaks = fivenum(Mortgage$margin))
plot(rate ~ coborrower, data = Mortgage)



