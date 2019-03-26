library(TeachingSampling)


### Name: E.PO
### Title: Estimation of the Population Total under Poisson Sampling
###   Without Replacement
### Aliases: E.PO
### Keywords: survey

### ** Examples

# Uses the Lucy data to draw a Poisson sample
data(Lucy)
attach(Lucy)
N <- dim(Lucy)[1]
# The population size is 2396. The expected sample size is 400
# The inclusion probability is proportional to the variable Income
n <- 400
Pik<-n*Income/sum(Income)
# The selected sample
sam <- S.PO(N,Pik)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The inclusion probabilities of each unit in the selected smaple
inclusion <- Pik[sam]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.PO(estima,inclusion)



