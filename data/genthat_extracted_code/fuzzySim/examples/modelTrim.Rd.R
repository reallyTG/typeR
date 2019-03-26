library(fuzzySim)


### Name: modelTrim
### Title: Trim off non-significant variables from a model
### Aliases: modelTrim
### Keywords: models

### ** Examples

# load sample data:

data(rotif.env)

names(rotif.env)


# build a stepwise model of a species' occurrence based on 
# some of the variables:

mod <- with(rotif.env, step(glm(Abrigh ~ Area + Altitude + AltitudeRange +
HabitatDiversity + HumanPopulation, family = binomial)))


# examine the model:

summary(mod)  # contains non-significant variables


# use modelTrim to get rid of non-significan effects:

mod <- modelTrim(mod)

summary(mod)  # only significant variables now




