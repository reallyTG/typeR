library(TeachingSampling)


### Name: PikHol
### Title: Optimal Inclusion Probabilities Under Multi-purpose Sampling
### Aliases: PikHol
### Keywords: survey

### ** Examples


#######################
#### First example ####
#######################

# Uses the Lucy data to draw an otpimal sample
# in a multipurpose survey context
data(Lucy)
attach(Lucy)
# Different sample sizes for two characteristics of interest: Employees and Taxes
N <- dim(Lucy)[1]
n <- c(350,400)
# The size measure is the same for both characteristics of interest,
# but the relationship in between is different
sigy1 <- sqrt(Income^(1))
sigy2 <- sqrt(Income^(2))
# The matrix containign the size measures for each characteristics of interest
sigma<-cbind(sigy1,sigy2)
# The vector of optimal inclusion probabilities under the Holmberg's approach
Piks<-PikHol(n,sigma,0.03)
# The optimal sample size is given by the sum of piks
n=round(sum(Piks))
# Performing the S.piPS function in order to select the optimal sample of size n
res<-S.piPS(n,Piks)
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Pik.s is the vector of inclusion probability of every single unit
# in the selected sample
Pik.s <- res[,2]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.piPS(estima,Pik.s)

########################
#### Second example ####
########################

# We can define our own first inclusion probabilities
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n <- c(350,400)

sigy1 <- sqrt(Income^(1))
sigy2 <- sqrt(Income^(2))
sigma<-cbind(sigy1,sigy2)
pikas <- cbind(rep(400/N, N), rep(400/N, N))

Piks<-PikHol(n,sigma,0.03, pikas)

n=round(sum(Piks))
n

res<-S.piPS(n,Piks)
sam <- res[,1]

data <- Lucy[sam,]
attach(data)
names(data)

Pik.s <- res[,2]
estima <- data.frame(Income, Employees, Taxes)
E.piPS(estima,Pik.s)



