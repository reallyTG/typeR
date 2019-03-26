library(TeachingSampling)


### Name: E.STpiPS
### Title: Estimation of the Population Total under Stratified Probability
###   Proportional to Size Sampling Without Replacement
### Aliases: E.STpiPS
### Keywords: survey

### ** Examples

# Uses the Lucy data to draw a stratified random sample 
# according to a PPS design in each stratum

data(Lucy)
attach(Lucy)
# Level is the stratifying variable
summary(Level)

# Defines the size of each stratum
N1<-summary(Level)[[1]]
N2<-summary(Level)[[2]]
N3<-summary(Level)[[3]]
N1;N2;N3

# Defines the sample size at each stratum
n1<-70
n2<-100
n3<-200
nh<-c(n1,n2,n3)
nh
# Draws a stratified sample
S <- Level
x <- Employees

res <- S.STpiPS(S, x, nh)
sam <- res[,1]
pik <- res[,2]

data <- Lucy[sam,]
attach(data)

estima <- data.frame(Income, Employees, Taxes)
E.STpiPS(estima,pik,Level)



