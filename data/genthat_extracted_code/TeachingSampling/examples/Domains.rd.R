library(TeachingSampling)


### Name: Domains
### Title: Domains Indicator Matrix
### Aliases: Domains
### Keywords: survey

### ** Examples

############
## Example 1
############
# This domain contains only two categories: "yes" and "no"
x <- as.factor(c("yes","yes","yes","no","no","no","no","yes","yes"))
Domains(x)

############
## Example 2
############
# Uses the Lucy data to draw a random sample of units according 
# to a SI design
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- sample(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
Doma
# HT estimation of the absolute domain size for every category in the domain
# of interest
E.SI(N,n,Doma)

############
## Example 3
############
# Following with Example 2... 
# The variables of interest are: Income, Employees and Taxes
# This function allows to estimate the population total of this variables for every 
# category in the domain of interest SPAM 
estima <- data.frame(Income, Employees, Taxes)
SPAM.no <- estima*Doma[,1]
SPAM.yes <- estima*Doma[,2]
E.SI(N,n,SPAM.no)
E.SI(N,n,SPAM.yes)



