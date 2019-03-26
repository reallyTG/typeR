library(psychomix)


### Name: simRaschmix
### Title: Simulate Data from Rasch Mixture Models
### Aliases: simRaschmix
### Keywords: item response Rasch model mixture model simulated data

### ** Examples

#################
## Rost's DGPs ##
#################

set.seed(1990)

## DGP 1 with just one latent class 
r1 <- simRaschmix(design = "rost1")
## less than 1800 observations because the extreme scorers have been removed
table(attr(r1, "ability"))
table(rowSums(r1))

## DGP 2 with 2 equally large latent classes
r2 <- simRaschmix(design = "rost2", extreme = TRUE)
## exactly 1800 observations including the extreme scorers
table(attr(r2, "ability"))
table(rowSums(r2))

## DGP 3 with 3 latent classes
r3 <- simRaschmix(design = "rost3")
## item parameters in the three latent classes
attr(r3, "difficulty")


####################################
## flexible specification of DGPs ##
####################################

set.seed(482)

## number of observations
nobs <- 8

## relative weights
weights <- c(1/4, 3/4)
## exact weights: either summing to nobs or an integer division thereof
weights <- c(2, 6)
weights <- c(1, 3)
## weights as function
## here the result is the same as when specifying relative weights
weights <- function(n) sample(size = n, 1:2, prob = c(1/4, 3/4), replace
= TRUE)

## class 1: only ability level 0
## class 2: normally distributed abilities with mean = 2 and sd = 1
ability <- cbind(c(0, 0), c(2, 1))
## class 1: 3 ability levels (-1, 0, 1); class 2: 2 ability levels (-0.5, 0.5)
## with equal probabilities and frequencies, repectively
ability <- array(c(cbind(-1:1, rep(1/3, 3)), cbind(-1:1/2, c(0.5, 0, 0.5))), 
  dim = c(3, 2, 2))
ability <- array(c(cbind(-1:1, rep(1, 3)), cbind(-1:1/2, c(1, 0, 1))),
  dim = c(3, 2, 2))
## ability as function
ability <- list(
  function(n) rnorm(n, mean = 0, sd = 0.5),
  function(n) sample(c(-0.5, 0.5), size = n, replace = TRUE)
)

## difficulty per latent class
difficulty <- cbind(c(-1,1,rep(0,8)), c(rep(0,8),1,-1))

## simulate data
dat <- simRaschmix(design = list(nobs = nobs, weights = weights,
  ability = ability, difficulty = difficulty))

## inspect attributes and raw scores
table(attr(dat, "cluster"))
hist(attr(dat, "ability"))
barplot(table(rowSums(dat)))
attr(dat, "difficulty")


## specification of DGP only via ability and difficulty
## one vector of abilities of all subjects
ability <- c(rnorm(4, mean = 0, sd = 0.5), sample(c(-0.5, 0.5), size = 4, 
  replace = TRUE))
## difficulty per subject
difficulty <- matrix(c(rep(c(-1,1,rep(0,8)), 4), rep(c(rep(0,8),1,-1), 4)),
  nrow = 8, byrow = TRUE)
## simulate data
dat <- simRaschmix(design = list(ability = ability, difficulty = difficulty))

## inspect attributes and raw scores
hist(attr(dat, "ability"))
barplot(table(rowSums(dat)))
attr(dat, "difficulty")



