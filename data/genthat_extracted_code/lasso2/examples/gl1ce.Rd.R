library(lasso2)


### Name: gl1ce
### Title: Generalized Regression With L1-constraint on the Parameters
### Aliases: gl1ce family.gl1ce
### Keywords: models optimize regression

### ** Examples

## example from base:
data(esoph)
summary(esoph)
## effects of alcohol, tobacco and interaction, age-adjusted
modEso <- formula(cbind(ncases, ncontrols) ~ agegp + tobgp * alcgp)
glm.E   <- glm(modEso, data = esoph, family = binomial())
gl1c.E <- gl1ce(modEso, data = esoph, family = binomial())
gl1c.E
plot(residuals(gl1c.E) ~ fitted(gl1c.E))

sg1c <- summary(gl1c.E)
sg1c

## Another comparison  glm() / gl1c.E:
plot(predict(glm.E,  type="link"), predict(glm.E,  type="response"),
     xlim = c(-3,0))
points(predict(gl1c.E, type="link"), predict(gl1c.E, type="response"),
       col = 2, cex = 1.5)

labels(gl1c.E)#-- oops! empty!!



