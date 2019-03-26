### R code from vignette source 'rebmix.Rnw'
### Encoding: CP1250

###################################################
### code chunk number 1: rebmix-code
###################################################
##############################################
## R sources for reproducing the results in ##
##   Marko Nagode:                          ##
##   rebmix: The Rebmix Package             ##
##############################################

options(prompt = "R> ", continue = "+  ", width = 80,
  useFancyQuotes = FALSE, digits = 3)


###################################################
### code chunk number 2: rebmix-code
###################################################
###################
## Preliminaries ##
###################

## load package and set prompt before starting new page to TRUE.

library("rebmix")
devAskNewPage(ask = TRUE)


###################################################
### code chunk number 3: rebmix-code
###################################################
######################
##  Gamma datasets  ##
######################

## Generate gamma datasets.

n <- c(100, 100, 100, 100)

Theta <- new("RNGMIX.Theta", c = 4, pdf = "gamma")

a.theta1(Theta) <- rep(1/100, 4)
a.theta2(Theta) <- c(200, 400, 600, 800)

gamma1 <- RNGMIX(Dataset.name = "gamma1", n = n, Theta = a.Theta(Theta))

n <- c(40, 360)

Theta <- new("RNGMIX.Theta", c = 2, pdf = "gamma")

a.theta1(Theta) <- c(1/27, 1 / 270)
a.theta2(Theta) <- c(9, 90)

gamma2 <- RNGMIX(Dataset.name = "gamma2", n = n, Theta = a.Theta(Theta))

n <- c(80, 240, 80)

Theta <- new("RNGMIX.Theta", c = 3, pdf = "gamma")

a.theta1(Theta) <- c(1/20, 1, 1/20)
a.theta2(Theta) <- c(40, 6, 200)

gamma3 <- RNGMIX(Dataset.name = "gamma3", rseed = -4, n = n, Theta = a.Theta(Theta))


###################################################
### code chunk number 4: rebmix-code
###################################################
## Estimate number of components, component weights and component parameters.

gamma1est <- REBMIX(Dataset = a.Dataset(gamma1),
  Preprocessing = "kernel density estimation",
  cmax = 8,
  Criterion = c("AIC", "BIC"),
  pdf = "gamma")

gamma2est <- REBMIX(Dataset = a.Dataset(gamma2),
  Preprocessing = "histogram",
  cmax = 8,
  Criterion = "BIC",
  pdf = "gamma")

gamma3est <- REBMIX(Dataset = a.Dataset(gamma3),
  Preprocessing = "histogram",
  cmax = 8,
  Criterion = "BIC",
  pdf = "gamma",
  K = 23:27)


###################################################
### code chunk number 5: gamma3-fig
###################################################
plot(gamma3est, pos = 1, what = c("den", "dis"), ncol = 2, npts = 1000)


###################################################
### code chunk number 6: rebmix-code
###################################################
summary(gamma2est)

a.theta1.all(gamma1est, pos = 2)

a.theta2.all(gamma1est, pos = 2)


###################################################
### code chunk number 7: rebmix-code
###################################################
## Bootstrap finite mixture.

gamma3boot <- boot(x = gamma3est, pos = 1, Bootstrap = "p", B = 10)

gamma3boot

summary(gamma3boot)


###################################################
### code chunk number 8: rebmix-code
###################################################
#########################
##   Poisson dataset   ##
#########################

## Generate the Poisson dataset.

n <- c(200, 200, 200)

Theta <- new("RNGMIX.Theta", c = 3, pdf = rep("Poisson", 2))

a.theta1(Theta, 1) <- c(3, 2)
a.theta1(Theta, 2) <- c(9, 10)
a.theta1(Theta, 3) <- c(15, 16)

poisson <- RNGMIX(Dataset.name = paste("Poisson_", 1:10, sep = ""), n = n, Theta = a.Theta(Theta))


###################################################
### code chunk number 9: rebmix-code
###################################################
## Estimate number of components, component weights and component parameters.

poissonest <- REBMIX(Dataset = a.Dataset(poisson),
  Preprocessing = "histogram",
  cmax = 10,
  Criterion = "MDL5",
  pdf = rep("Poisson", 2),
  K = 1)


###################################################
### code chunk number 10: poisson-fig
###################################################
plot(poissonest, pos = 9, what = c("dens", "marg", "IC", "D", "logL"), nrow = 2, ncol = 3, npts = 1000)


###################################################
### code chunk number 11: poisson-clu-fig
###################################################
poissonclu <- RCLRMIX(x = poissonest, pos = 9, Zt = a.Zt(poisson))

plot(poissonclu)


###################################################
### code chunk number 12: rebmix-code
###################################################
## Visualize results.

summary(poissonest)

a.theta1.all(poissonest, pos = 9)

a.theta2.all(poissonest, pos = 9)


###################################################
### code chunk number 13: rebmix-code
###################################################
data("wreath", package = "mclust")


###################################################
### code chunk number 14: rebmix-code
###################################################
## Estimate number of components, component weights and component parameters.

wreathest <- REBMIX(model = "REBMVNORM",
  Dataset = list(as.data.frame(wreath)),
  Preprocessing = "histogram",
  cmax = 20,
  Criterion = "BIC")


###################################################
### code chunk number 15: wreath-fig
###################################################
plot(wreathest)


###################################################
### code chunk number 16: wreath-clu-fig
###################################################
wreathclu <- RCLRMIX(model = "RCLRMVNORM", x = wreathest)

plot(wreathclu, s = 14)


###################################################
### code chunk number 17: rebmix-code
###################################################
summary(wreathest)


###################################################
### code chunk number 18: rebmix-code
###################################################
summary(wreathclu)


###################################################
### code chunk number 19: rebmix-code
###################################################
data("Baudry_etal_2010_JCGS_examples", package = "mclust")


###################################################
### code chunk number 20: rebmix-code
###################################################
## Estimate number of components, component weights and component parameters.

ex4.1est <- REBMIX(model = "REBMVNORM",
  Dataset = list(as.data.frame(ex4.1)),
  Preprocessing = "kernel density estimation",
  cmax = 10,
  Criterion = "AIC")


###################################################
### code chunk number 21: ex4_1-fig
###################################################
plot(ex4.1est, pos = 1, what = c("dens"), nrow = 1, ncol = 1)


###################################################
### code chunk number 22: ex4_1-clu-fig
###################################################
ex4.1clu <- RCLRMIX(model = "RCLRMVNORM", x = ex4.1est)

plot(ex4.1clu)


###################################################
### code chunk number 23: rebmix-code
###################################################
summary(ex4.1est)


###################################################
### code chunk number 24: rebmix-code
###################################################
data("iris")

# Show level attributes discrete variables.

levels(iris[["Class"]])

# Split dataset into train (75%) and test (25%) subsets.

set.seed(5)

Iris <- split(p = 0.75, Dataset = iris, class = 5)


###################################################
### code chunk number 25: rebmix-code
###################################################
# Estimate number of components, component weights and component
# parameters for train subsets.

irisest <- REBMIX(model = "REBMVNORM",
  Dataset = a.train(Iris),
  Preprocessing = "kernel density estimation",
  cmax = 10,
  Criterion = "ICL-BIC")


###################################################
### code chunk number 26: rebmix-code
###################################################
# Selected features.

iriscla <- RCLSMIX(model = "RCLSMVNORM",
  x = list(irisest),
  Dataset = a.test(Iris),
  Zt = a.Zt(Iris))


###################################################
### code chunk number 27: rebmix-code
###################################################
iriscla

summary(iriscla)


###################################################
### code chunk number 28: iris-cla-fig
###################################################
# Plot selected features.

plot(iriscla, nrow = 3, ncol = 2)


###################################################
### code chunk number 29: rebmix-code
###################################################
data("adult")

# Find complete cases.

adult <- adult[complete.cases(adult),]

# Replace levels with numbers.

adult <- as.data.frame(data.matrix(adult))


###################################################
### code chunk number 30: rebmix-code
###################################################
# Find numbers of levels.

cmax <- unlist(lapply(apply(adult[, c(-1, -16)], 2, unique), length))

cmax


###################################################
### code chunk number 31: rebmix-code
###################################################
# Split adult dataset into train and test subsets for two Incomes
# and remove Type and Income columns.

Adult <- split(p = list(type = 1, train = 2, test = 1),
  Dataset = adult, class = 16)


###################################################
### code chunk number 32: rebmix-code
###################################################
# Estimate number of components, component weights and component parameters
# for the set of chunks 1:14.

adultest <- list()

for (i in 1:14) {
  adultest[[i]] <- REBMIX(Dataset = a.train(chunk(Adult, i)),
    Preprocessing = "histogram",
    cmax = min(120, cmax[i]),
    Criterion = "BIC",
    pdf = "Dirac",
    K = 1)
}


###################################################
### code chunk number 33: rebmix-code
###################################################
# Class membership prediction based upon the best first search algorithm.

adultcla <- BFSMIX(x = adultest,
  Dataset = a.test(Adult),
  Zt = a.Zt(Adult))


###################################################
### code chunk number 34: rebmix-code
###################################################
adultcla

summary(adultcla)


###################################################
### code chunk number 35: adult-cla-fig
###################################################
# Plot selected chunks.

plot(adultcla, nrow = 5, ncol = 2)


###################################################
### code chunk number 36: rebmix-code
###################################################
rm(list = ls())


