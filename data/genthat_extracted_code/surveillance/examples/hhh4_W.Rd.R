library(surveillance)


### Name: hhh4_W
### Title: Power-Law and Nonparametric Neighbourhood Weights for
###   'hhh4'-Models
### Aliases: W_powerlaw W_np
### Keywords: spatial models utilities

### ** Examples

data("measlesWeserEms")

## data contains neighbourhood orders as required for parametric weights
neighbourhood(measlesWeserEms)[1:6,1:6]
max(neighbourhood(measlesWeserEms))  # max order is 5

## fit a power-law decay of spatial interaction
## in a hhh4 model with seasonality and random intercepts in the endemic part
measlesModel <- list(
    ar = list(f = ~ 1),
    ne = list(f = ~ 1, weights = W_powerlaw(maxlag=5, normalize=TRUE, log=FALSE)),
    end = list(f = addSeason2formula(~-1 + ri(), S=1, period=52),
               offset = population(measlesWeserEms)),
    family = "NegBin1")

## fit the model
set.seed(1)  # random intercepts are initialized randomly
measlesFit <- hhh4(measlesWeserEms, measlesModel)
summary(measlesFit)  # "neweights.d" is the decay parameter d

## plot the spatio-temporal weights o_ji^-d / sum_k o_jk^-d
## as a function of neighbourhood order
plot(measlesFit, type="neweights")
## Due to normalization, same distance does not necessarily mean same weight.
## There is no evidence for a power law of spatial interaction in this
## small observation region with only 17 districts.
## A possible simpler model is first-order dependence, i.e., using
## 'weights = neighbourhood(measlesWeserEms) == 1' in the 'ne' component.



