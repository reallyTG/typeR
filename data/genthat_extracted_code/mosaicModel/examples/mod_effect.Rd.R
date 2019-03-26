library(mosaicModel)


### Name: mod_effect
### Title: Calculate effect sizes in a model
### Aliases: mod_effect

### ** Examples

mod1 <- lm(wage ~ age * sex * educ + sector, data = mosaicData::CPS85)
mod_effect(mod1, ~ sex)
mod_effect(mod1, ~ sector)
mod_effect(mod1, ~ age, sex = "M", educ = c(10, 12, 16), age = c(30, 40))
mod_effect(mod1, ~ age, sex = "F", age = 34, step = 1)
mod_effect(mod1, ~ sex, age = 35, sex = "M", to = "F" )
# For classifiers, the change in *probability* of a level is reported.
mod2 <- rpart::rpart(sector ~ age + sex + educ + wage, data = mosaicData::CPS85)
mod_effect(mod2, ~ educ)
mod_effect(mod2, ~ educ, class_level = "manag")



