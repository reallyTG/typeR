library(TeachingSampling)


### Name: PikSTPPS
### Title: Inclusion Probabilities in Stratified Proportional to Size
###   Sampling Designs
### Aliases: PikSTPPS

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Vector Strata contains an indicator variable of stratum membership
Strata <- c("A", "A", "A", "B", "B")
# The sample size in each stratum
nh <- c(2,2)
# The vector of inclusion probablities for a stratified piPS sample 
# without replacement of size two within each stratum
Pik <- PikSTPPS(Strata, x, nh)
Pik

# Some checks
sum(Pik)
sum(nh)

############
## Example 2
############
# Uses the Lucy data to compute the vector of inclusion probablities 
# for a stratified random sample according to a piPS design in each stratum

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

# Computes the inclusion probabilities for the stratified population
S <- Level
x <- Employees
Pik <- PikSTPPS(S, x, nh)

# Some checks
sum(Pik)
sum(nh)



