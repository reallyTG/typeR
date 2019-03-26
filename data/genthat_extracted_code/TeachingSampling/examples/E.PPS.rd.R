library(TeachingSampling)


### Name: E.PPS
### Title: Estimation of the Population Total under Probability
###   Proportional to Size Sampling With Replacement
### Aliases: E.PPS
### Keywords: survey

### ** Examples

# Uses the Lucy data to draw a random sample according to a
# PPS with replacement design
data(Lucy)
attach(Lucy)
# The selection probability of each unit is proportional to the variable Income
m <- 400
res <- S.PPS(m,Income)
# The selected sample
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# pk.s is the selection probability of each unit in the selected sample
pk.s <- res[,2]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.PPS(estima,pk.s)



