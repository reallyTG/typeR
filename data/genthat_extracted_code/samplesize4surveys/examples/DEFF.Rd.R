library(samplesize4surveys)


### Name: DEFF
### Title: Estimated sample Effects of Design (DEFF)
### Aliases: DEFF

### ** Examples

#############################
# Example with BigLucy data #
#############################
data(BigLucy)
attach(BigLucy)

# The sample size
n <- 400
res <- S.piPS(n, Income)
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- BigLucy[sam,]
attach(data)
names(data)
# Pik.s is the inclusion probability of every single unit in the selected sample
pik <- res[,2]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.piPS(estima,pik)
DEFF(estima,pik)



