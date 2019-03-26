library(mosaicModel)


### Name: mod_eval
### Title: Evaluate a model for specified inputs
### Aliases: mod_eval

### ** Examples

## Not run: 
##D mod1 <- lm(wage ~ age * sex + sector, data = mosaicData::CPS85)
##D mod_eval(mod1)
##D mod2 <- glm(married == "Married" ~ age + sex * sector,
##D             data = mosaicData::CPS85, family = "binomial")
##D mod_eval(mod2, nlevels = 2)
##D mod_eval(mod2, nlevels = 2, sex = "F") 
## End(Not run)



