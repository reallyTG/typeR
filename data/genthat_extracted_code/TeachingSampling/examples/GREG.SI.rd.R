library(TeachingSampling)


### Name: GREG.SI
### Title: The Generalized Regression Estimator under SI sampling design
### Aliases: GREG.SI
### Keywords: survey

### ** Examples

######################################################################
## Example 1: Linear models involving continuous auxiliary information
######################################################################

# Draws a simple random sample without replacement
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)

########### common mean model

estima<-data.frame(Income, Employees, Taxes)
x <- rep(1,n)
model <- E.Beta(N, n, estima, x, ck=1,b0=FALSE)
b <- t(as.matrix(model[1,,]))
tx <- c(N)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)

########### common ratio model

estima<-data.frame(Income)
x <- data.frame(Employees)
model <- E.Beta(N, n, estima, x, ck=x,b0=FALSE)
b <- t(as.matrix(model[1,,]))
tx <- sum(Lucy$Employees)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)

########### Simple regression model without intercept

estima<-data.frame(Income, Employees)
x <- data.frame(Taxes)
model <- E.Beta(N, n, estima, x, ck=1,b0=FALSE)
b <- t(as.matrix(model[1,,]))
tx <- sum(Lucy$Taxes)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)

########### Multiple regression model without intercept

estima<-data.frame(Income)
x <- data.frame(Employees, Taxes)
model <- E.Beta(N, n, estima, x, ck=1, b0=FALSE)
b <- as.matrix(model[1,,])
tx <- c(sum(Lucy$Employees), sum(Lucy$Taxes))
GREG.SI(N,n,estima,x,tx, b, b0=FALSE) 

########### Simple regression model with intercept

estima<-data.frame(Income, Employees)
x <- data.frame(Taxes)
model <- E.Beta(N, n, estima, x, ck=1,b0=TRUE) 
b <- as.matrix(model[1,,])
tx <- c(N, sum(Lucy$Taxes))
GREG.SI(N,n,estima,x,tx, b, b0=TRUE) 

########### Multiple regression model with intercept

estima<-data.frame(Income)                               
x <- data.frame(Employees, Taxes)
model <- E.Beta(N, n, estima, x, ck=1,b0=TRUE)
b <- as.matrix(model[1,,])
tx <- c(N, sum(Lucy$Employees), sum(Lucy$Taxes))            
GREG.SI(N,n,estima,x,tx, b, b0=TRUE) 

####################################################################
## Example 2: Linear models with discrete auxiliary information
####################################################################

# Draws a simple random sample without replacement
data(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)

# The auxiliary information is discrete type
Doma<-Domains(Level)

########### Poststratified common mean model

estima<-data.frame(Income, Employees, Taxes)
model <- E.Beta(N, n, estima, Doma, ck=1,b0=FALSE)
b <- t(as.matrix(model[1,,]))
tx <- colSums(Domains(Lucy$Level))
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 

########### Poststratified common ratio model 

estima<-data.frame(Income, Employees)
x <- Doma*Taxes
model <- E.Beta(N, n, estima, x ,ck=1,b0=FALSE)
b <- as.matrix(model[1,,])
tx <- colSums(Domains(Lucy$Level)*Lucy$Taxes)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE) 

######################################################################
## Example 3: Domains estimation trough the postestratified estimator
######################################################################

# Draws a simple random sample without replacement
data(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)

# The auxiliary information is discrete type
Doma<-Domains(Level)

########### Poststratified common mean model for the 
  # Income total in each poststratum ###################

estima<-Doma*Income
model <- E.Beta(N, n, estima, Doma, ck=1, b0=FALSE)
b <- t(as.matrix(model[1,,]))
tx <- colSums(Domains(Lucy$Level))
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 

########### Poststratified common mean model for the 
  # Employees total in each poststratum ###################

estima<-Doma*Employees
model <- E.Beta(N, n, estima, Doma, ck=1,b0=FALSE)
b <- t(as.matrix(model[1,,]))
tx <- colSums(Domains(Lucy$Level))
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 

########### Poststratified common mean model for the 
  # Taxes total in each poststratum ###################

estima<-Doma*Taxes
model <- E.Beta(N, n, estima, Doma, ck=1, b0=FALSE)
b <- t(as.matrix(model[1,,]))
tx <- colSums(Domains(Lucy$Level))
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 




