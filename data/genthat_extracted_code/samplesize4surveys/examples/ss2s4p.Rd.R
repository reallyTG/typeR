library(samplesize4surveys)


### Name: ss2s4p
### Title: Sample Sizes in Two-Stage sampling Designs for Estimating Signle
###   Proportions
### Aliases: ss2s4p

### ** Examples


ss2s4p(N=100000, p=0.5, me=0.03, M=50, by=5, rho=0.01)
ss2s4p(N=100000, p=0.5, me=0.05, M=50, by=5, rho=0.1)
ss2s4p(N=100000, p=0.5, me=0.03, M=500, by=100, rho=0.2) 

############################
# Example 2 with Lucy data #
############################

data(Lucy)
attach(Lucy)
N <- nrow(Lucy)
p <- prop.table(table(SPAM))[1]
y <- as.double(SPAM)
cl <- Zone

rho <- ICC(y,cl)$ICC
M <- length(levels(Zone))
ss2s4p(N, 0.99, conf=0.9, me=0.03, M=5, by=1, rho=rho)



