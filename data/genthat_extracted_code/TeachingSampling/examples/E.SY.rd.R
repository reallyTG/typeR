library(TeachingSampling)


### Name: E.SY
### Title: Estimation of the Population Total under Systematic Sampling
###   Without Replacement
### Aliases: E.SY
### Keywords: survey

### ** Examples

# Uses the Lucy data to draw a Systematic sample
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
# The population is divided in 6 groups
# The selected sample
sam <- S.SY(N,6)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.SY(N,6,estima)



