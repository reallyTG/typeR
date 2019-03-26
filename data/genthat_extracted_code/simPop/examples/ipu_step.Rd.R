library(simPop)


### Name: ipu_step
### Title: Perform one step of iterative proportional updating
### Aliases: ipu_step combine_factors ipu_step ipu_step_ref ipu_step
###   ipu_step_f

### ** Examples


############# one-dimensional ipu ##############

## create random data
nobs <- 10
classLabels <- letters[1:3]
dat = data.frame(
  weight = exp(rnorm(nobs)),
  household = factor(sample(classLabels, nobs, replace = TRUE))
)
dat

## create targets (same lenght as classLabels!)
targets <- 3:5

## calculate weights
new_weight <- ipu_step(dat$weight, dat$household, targets)
cbind(dat, new_weight)

## check solution
xtabs(new_weight ~ dat$household)

## calculate weights "by reference"
ipu_step_ref(dat$weight, dat$household, targets)
dat

############# multidimensional ipu ##############

## load data
factors <- c("time", "sex", "smoker", "day")
data(tips, package = "reshape2")
tips <- tips[factors]

## combine factors
cf <- combine_factors(tips, names(tips))
cbind(tips, cf)[sample(nrow(tips), 10),]

## adjust weights
con <- xtabs(~., tips)
weight <- rnorm(nrow(tips)) + 5
adjusted_weight <- ipu_step(weight, cf, con)

## check outputs
con2 <- xtabs(adjusted_weight ~ ., data = tips)
sum((con - con2)^2)




