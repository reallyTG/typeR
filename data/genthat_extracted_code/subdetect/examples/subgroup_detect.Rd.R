library(subdetect)


### Name: subgroup_detect
### Title: Test for and Identify a Subgroup with an Enhanced Treatment
###   Effect.
### Aliases: subgroup_detect

### ** Examples

#set parameters
tau <- 0.5
theta_t <- c(-0.15,0.3,sqrt(1-(-0.15)^2-(0.3)^2))
beta <- c(1,1,1)
sigma <- 0.5
n <- 50
p <- 2

#generate data
x1 <- rbinom(n,size=1,prob=0.5)
x2 <- runif(n,min=-1,max=1)
X <- cbind(1,x1,x2)
a <- rbinom(n,1,prob=0.5)
y <- drop(X%*%beta) + tau*a*(drop(X%*%theta_t)>=0) + rnorm(n,0,sigma)

data <- data.frame(X[,2:3], a, y)

subgroup_detect(outcome = y~x1+x2,
                propen = a~x1+x2,
                data = data)



