library(TeachingSampling)


### Name: E.BE
### Title: Estimation of the Population Total under Bernoulli Sampling
###   Without Replacement
### Aliases: E.BE
### Keywords: survey

### ** Examples

# Uses the Lucy data to draw a Bernoulli sample
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n=400
prob=n/N
sam <- S.BE(N,prob)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.BE(estima,prob)



