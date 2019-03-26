library(bayesmix)


### Name: JAGSrun
### Title: MCMC sampling of Bayesian models
### Aliases: JAGSrun print.jags jags
### Keywords: utilities

### ** Examples

data("fish", package = "bayesmix")
prefix <- "fish"
variables <- c("mu","tau","eta")
k <- 3
modelFish <- BMMmodel(k = k, priors = list(kind = "independence",
                      parameter = "priorsFish", hierarchical = "tau"))
controlFish <- JAGScontrol(variables = c(variables, "S"), n.iter = 100)
z1 <- JAGSrun(fish, prefix, model = modelFish, initialValues = list(S0 = 2),
              control = controlFish, cleanup = TRUE, tmp = FALSE)
zSort <- Sort(z1, "mu")
BMMposteriori(zSort)

data("darwin", package = "bayesmix")
prefix <- "darwin"
k <- 2
modelDarwin <- BMMmodel(k = k, priors = list(kind = "independence",
                        parameter = "priorsUncertain"),
                        aprioriWeights = c(1, 15),
                        no.empty.classes = TRUE, restrict = "tau")
z2 <- JAGSrun(darwin, prefix, model = modelDarwin, control =
              JAGScontrol(variables = variables, n.iter = 3000,
              burn.in = 1000), cleanup = TRUE, tmp = FALSE)
plot(z2, variables = "mu")



