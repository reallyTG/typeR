library(QGglmm)


### Name: QGmvpred
### Title: Predict the evolutionary response to selection on the observed
###   scale
### Aliases: QGmvpred

### ** Examples

## Bivariate example with a binary trait and a Gaussian one

# Assume a bivariate GLMM with Binomial(probit)/Gaussian distributions with:
mu <- c(0, 10)
G <- matrix(c(0.5, 0, 0, 1), nrow = 2)
P <- matrix(c(1, 0, 0, 2), nrow = 2) 

# Link functions
inv.links = function(vec){c(pnorm(vec[1]), vec[2])}

# Creating the expected fitness function
# i.e. expected fitness given a latent trait vector l
# Say if the binary trait is 1, then the fitness is 0.5 * "the Gaussian trait"
# But if the binary trait is 0, then the fitness is 0
lat.fit <- function(mat) {pnorm(mat[1, ]) * 0.5 * mat[2, ]}
# Derivative of the above function
# This function yields a vector which elements are the derivative according to each trait
d.lat.fit <- function(mat) {matrix(c(dnorm(mat[1, ]) * 0.5 * mat[2, ], pnorm(mat[1, ]) * 0.5),
                            nrow = 2, 
                            byrow = TRUE)}

# Predicting the latent evolutionary response
pred<- QGmvpred(mu = mu, vcv.P = P, vcv.G = G, fit.func = lat.fit, d.fit.func = d.lat.fit)


# Predicting the observed evolutionary response
# Current observed phenotypic mean
QGmvmean(mu = mu, vcov = P, link.inv = inv.links)
# Predicted observed phenotypic mean after selection
QGmvmean(mu = mu + pred$lat.resp, vcov = P, link.inv = inv.links)



