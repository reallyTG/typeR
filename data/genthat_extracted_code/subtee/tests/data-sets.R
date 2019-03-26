## this is no test
## this is the code used to generate the example data

## simulate data-sets for testing and illustrating the software
set.seed(49)
height <- rnorm(100, mean = 175, sd = 5)
labvalue <- rgamma(100, shape = 1, scale = 1)
region <- factor(sample(c("US", "EU", "Japan"), 100, replace=TRUE)) 
smoker <- as.factor(rbinom(100, size = 1, prob = 0.5)) 
dat <- data.frame(height, labvalue, region, smoker)

## treatment variable
treat <- as.numeric(rbinom(100, size = 1, prob = 0.5))

## additional covariates to be included in the model 
x1 <- rnorm(100)
x2 <- rnorm(100)
dat <- cbind(dat, x1, x2)

## normal outcome
y <- rnorm(100) 
datnorm <- cbind(y, treat, dat)
## binary outcome
y <- rbinom(100, 1, 0.25)
datbin <- cbind(y, treat, dat)
## survival outcome
y <- rexp(100, 0.1)
event <- rbinom(100, 1, 0.2)
datsurv <- cbind(y, treat, event, dat)
## count outcome
exposure <- rexp(100, 1)
y <- rnbinom(100, size=0.5, mu=5*exposure)
datcount <- cbind(y, treat, exposure, dat)

