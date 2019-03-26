library(REndo)


### Name: latentIV
### Title: Fitting Linear Models with one Endogenous Regressor using Latent
###   Instrumental Variables
### Aliases: latentIV

### ** Examples

## No test: 
data(dataLatentIV)

# function call without any initial parameter values
l  <- latentIV(y ~ P, data = dataLatentIV)
summary(l)

# function call with initial parameter values given by the user
l1 <- latentIV(y ~ P, start.params = c("(Intercept)"=2.5, P=-0.5),
               data = dataLatentIV)
summary(l1)

# use own optimization settings (see optimx())
# set maximum number of iterations to 50'000
l2 <- latentIV(y ~ P, optimx.args = list(itnmax = 50000),
               data = dataLatentIV)

# print detailed tracing information on progress
l3 <- latentIV(y ~ P, optimx.args = list(control = list(trace = 6)),
               data = dataLatentIV)

# use method L-BFGS-B instead of Nelder-Mead and print report every 50 iterations
l4 <- latentIV(y ~ P, optimx.args = list(method = "L-BFGS-B", control=list(trace = 2, REPORT=50)),
               data = dataLatentIV)

# read out all coefficients, incl auxiliary coefs
lat.all.coefs <- coef(l4)
# same as above
lat.all.coefs <- coef(l4, complete = TRUE)
# only main model coefs
lat.main.coefs <- coef(l4, complete = FALSE)
## End(No test)




