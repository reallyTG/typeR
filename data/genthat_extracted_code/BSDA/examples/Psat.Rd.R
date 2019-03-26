library(BSDA)


### Name: Psat
### Title: PSAT scores versus SAT scores
### Aliases: Psat
### Keywords: datasets

### ** Examples


model <- lm(sat ~ psat, data = Psat)
par(mfrow = c(1, 2))
plot(Psat$psat, resid(model))
plot(model, which = 1)
rm(model)
par(mfrow = c(1, 1))




