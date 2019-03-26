library(ITRLearn)


### Name: MPL
### Title: Maixmin projection learning for optimal individualized treatment
###   regime
### Aliases: MPL MPL.fit
### Keywords: Maximin projection learning

### ** Examples

set.seed(12345)
X <- matrix(rnorm(1600), 800, 2)
A <- rbinom(800, 1, 0.5)
h <- 1+sin(0.5*pi*X[,1]+0.5*pi*X[,2])
tau <- rep(0, 800)
B <- matrix(0, 2, 4)
B[,1] <- c(2,0)
B[,2] <- 2*c(cos(15*pi/180), sin(15*pi/180))
B[,3] <- 2*c(cos(70*pi/180), sin(70*pi/180))
B[,4] <- c(0,2)
for (g in 1:4){
    tau[((g-1)*200+1):(g*200)] <- X[((g-1)*200+1):(g*200),]%*%B[,g]
}
## mean and scale of the subgroup covariates are allowed to be different
X[1:200,1] <- X[1:200,1]+1
X[201:400,2] <- 2*X[201:400,2]-1
X[601:800,] <- X[601:800,]/2
Y <- h+A*tau+0.5*rnorm(800)
G <- c(rep(1,200), rep(2,200), rep(3,200), rep(4,200))

## Q-learning
result <- MPL(Y~X|A|G, method="Q")

## A-learning
result <- MPL(Y~X|A|G)

## treating as homogeneous
result <- MPL(Y~X|A)

## No test: 
result <- MPL(Y~X|A|G, bootstrap=TRUE)
## End(No test)



