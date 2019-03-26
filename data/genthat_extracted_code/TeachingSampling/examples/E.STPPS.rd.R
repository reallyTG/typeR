library(TeachingSampling)


### Name: E.STPPS
### Title: Estimation of the Population Total under Stratified Probability
###   Proportional to Size Sampling With Replacement
### Aliases: E.STPPS
### Keywords: survey

### ** Examples

# Uses the Lucy data to draw a stratified random sample 
# according to a PPS design in each stratum

data(Lucy)
attach(Lucy)
# Level is the stratifying variable
summary(Level)
# Defines the sample size at each stratum
m1<-70
m2<-100
m3<-200
mh<-c(m1,m2,m3)
# Draws a stratified sample
res<-S.STPPS(Level, Income, mh)
# The selected sample
sam<-res[,1]
# The selection probability of each unit in the selected sample
pk <- res[,2]
pk
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.STPPS(estima,pk,mh,Level)



