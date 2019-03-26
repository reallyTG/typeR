library(CompRandFld)


### Name: HypoTest
### Title: Statistical Hypothesis Tests for Nested Models
### Aliases: HypoTest
### Keywords: spatial

### ** Examples

# Please remove the symbol hashtag to run the code

library(CompRandFld)
library(RandomFields)
set.seed(3451)

# Define the spatial-coordinates of the points:
x <- runif(300, 0, 10)
y <- runif(300, 0, 10)

################################################################
###
### Example 1. Composite likelihood-based hypothesis testing.
### Simulation of a Gaussian spatial random field with
### stable correlation.
### Estimation by composite likelihood using the setting:
### marginal pairwise likelihood objects.
###
###############################################################

# Set the model's parameters:
corrmodel <- "stable"
mean <- 0
sill <- 1
nugget <- 1
scale <- 1
power <- 1.3

# Simulation of the spatial Gaussian random field:
data <- RFsim(x, y, corrmodel=corrmodel, param=list(mean=mean,
              sill=sill,nugget=nugget,scale=scale,power=power))$data

# Maximum composite-likelihood fitting of the random field, full model:
fit1 <- FitComposite(data, x, y, corrmodel=corrmodel, maxdist=5,
                    varest=TRUE,start=list(mean=mean,power=power,scale=scale,sill=sill),
                    fixed=list(nugget=1))

# Maximum composite-likelihood fitting of the random field, first nasted model:
fit2 <- FitComposite(data, x, y, corrmodel=corrmodel, maxdist=5,
                    varest=TRUE,start=list(mean=mean,power=power,scale=scale),
                    fixed=list(nugget=1,sill=1))

# Maximum composite-likelihood fitting of the random field, second nasted model:
fit3 <- FitComposite(data, x, y, corrmodel=corrmodel, maxdist=5,
                    varest=TRUE,start=list(scale=scale),
                    fixed=list(nugget=1,sill=1,mean=0,power=1.3))

# Hypothesis testing results:
# composite Wald-type statistic:
HypoTest(fit1, fit2, fit3, statistic='Wald')

# composite score-type statistic:
HypoTest(fit1, fit2, fit3, statistic='Rao')

# composite likelihood ratio statistic with RJ adjustment:
HypoTest(fit1, fit2, fit3, statistic='WilksRJ')

# composite likelihood ratio statistic with S adjustment:
HypoTest(fit1, fit2, fit3, statistic='WilksS')

# composite likelihood ratio statistic with CB adjustment:
HypoTest(fit1, fit2, fit3, statistic='WilksCB')

# composite likelihood ratio statistic with PSS adjustment:
HypoTest(fit1, fit2, fit3, statistic='WilksPSS')




