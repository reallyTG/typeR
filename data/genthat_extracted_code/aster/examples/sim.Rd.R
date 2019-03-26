library(aster)


### Name: sim
### Title: Simulated Life History Data
### Aliases: sim beta.true mu.true phi.true theta.true fam pred vars ladata
###   redata
### Keywords: datasets

### ** Examples

data(sim)
out6 <- aster(resp ~ varb + 0 + z1 + z2 + I(z1^2) + I(z1*z2) + I(z2^2),
    pred, fam, varb, id, root, data = redata)
summary(out6)
lout <- lm(y ~ z1 + z2 + I(z1^2) + I(z1*z2) + I(z2^2), data = ladata)
summary(lout)



