library(ltm)


### Name: tpm
### Title: Birnbaum's Three Parameter Model
### Aliases: tpm
### Keywords: multivariate regression

### ** Examples


# the three parameter model
tpm(LSAT)

# use 'nlminb' as optimizer
tpm(LSAT, control = list(optimizer = "nlminb"))


# the three parameter model with equal 
# discrimination parameter across items
# fix the guessing parameter for the third item to zero
tpm(LSAT, type = "rasch", constraint = cbind(3, 1, 0))


# the three parameter model for the Abortion data
fit <- tpm(Abortion)
fit

# the guessing parameter estimates for items 1, 3, and 4 seem to be on
# the boundary; update the fit by fixing them to zero
update(fit, constraint = cbind(c(1, 3, 4), 1, 0))




