library(acebayes)


### Name: aceglm
### Title: Approximate Coordinate Exchange (ACE) Algorithm for Generalised
###   Linear Models
### Aliases: aceglm paceglm

### ** Examples

## This example uses aceglm to find a Bayesian D-optimal design for a 
## first order logistic regression model with 6 runs 4 factors. The priors are 
## those used by Overstall & Woods (2017), with each of the five
## parameters having a uniform prior. The design space for each coordinate is [-1, 1].

set.seed(1)
## Set seed for reproducibility.

n<-6
## Specify the sample size (number of runs).

start.d<-matrix(2 * randomLHS(n = n,k = 4) - 1,nrow = n,ncol = 4,
dimnames = list(as.character(1:n), c("x1", "x2", "x3", "x4")))
## Generate an initial design of appropriate dimension. The initial design is a 
## Latin hypercube sample.

low<-c(-3, 4, 5, -6, -2.5)
upp<-c(3, 10, 11, 0, 3.5)
## Lower and upper limits of the uniform prior distributions.

prior<-function(B){
t(t(6*matrix(runif(n = 5 * B),ncol = 5)) + low)}
## Create a function which specifies the prior. This function will return a 
## B by 5 matrix where each row gives a value generated from the prior 
## distribution for the model parameters.

example1<-aceglm(formula=~x1+x2+x3+x4, start.d = start.d, family = binomial, 
prior = prior, method = "MC", N1 = 1, N2 = 0, B = c(1000, 1000))
## Call the aceglm function which implements the ACE algorithm requesting 
## only one iteration of Phase I and zero iterations of Phase II. The Monte
## Carlo sample size for the comparison procedure (B[1]) is set to 100.

example1
## Print out a short summary.

#Generalised Linear Model 
#Criterion = Bayesian D-optimality 
#Formula: ~x1 + x2 + x3 + x4
#
#Family: binomial 
#Link function: logit 
#
#Method:  MC 
#
#B:  1000 1000 
#
#Number of runs = 6
#
#Number of factors = 4
#
#Number of Phase I iterations = 1
#
#Number of Phase II iterations = 0
#
#Computer time = 00:00:01

example1$phase2.d
## Look at the final design.

#          x1          x2          x3         x4
#1 -0.3571245  0.16069337 -0.61325375  0.9276443
#2 -0.9167309  0.91411512  0.69842151  0.2605092
#3 -0.8843699  0.42863930 -1.00000000 -0.9679402
#4  0.3696224 -0.27126080  0.65284076  0.1850767
#5  0.7172267 -0.34743402 -0.05968457 -0.6588896
#6  0.7469636  0.05854029  1.00000000 -0.1742566


prior2 <- list(support = rbind(low, upp))
## A list specifying the parameters of the uniform prior distribution

example2<-aceglm(formula = ~ x1 +x2 + x3 + x4, start.d = start.d, family = binomial, 
prior = prior2, N1 = 1, N2 = 0)
## Call the aceglm function with the default method of "quadrature"

example2$phase2.d
## Final design

#          x1          x2         x3          x4
#1 -0.3269814  0.08697755 -0.7583228  1.00000000
#2 -0.8322237  0.86652194  0.5747066  0.51442169
#3 -0.8987852  0.48881387 -0.8554894 -1.00000000
#4  0.3441093 -0.29050147  0.4704248  0.07628932
#5  0.8371670 -0.42361888  0.1429862 -0.95080251
#6  0.6802119  0.10853163  1.0000000  0.75421678

mean(example1$utility(d = example1$phase2.d, B = 20000))
#[1] -11.55139
mean(example2$utility(d = example2$phase2.d, B = 20000))
#[1] -11.19838
## Compare the two designs using the Monte Carlo approximation



