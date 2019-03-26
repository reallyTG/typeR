library(TeachingSampling)


### Name: E.WR
### Title: Estimation of the Population Total under Simple Random Sampling
###   With Replacement
### Aliases: E.WR
### Keywords: survey

### ** Examples

# Uses the Lucy data to draw a random sample according to a WR design
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
m <- 400
sam <- S.WR(N,m)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.WR(N,m,estima)



