library(GMMBoost)


### Name: OrdinalBoost
### Title: Fit Generalized Mixed-Effects Models
### Aliases: OrdinalBoost
### Keywords: models methods

### ** Examples
 

data(knee)

# fit a sequential model
# (here only one step is performed in order to
# save computational time)

glm1 <- OrdinalBoost(pain ~ time + th + age + sex, rnd = list(id=~1),
        data = knee, model = "sequential", control = list(steps=1))

# see also demo("OrdinalBoost-knee") for more extensive examples



