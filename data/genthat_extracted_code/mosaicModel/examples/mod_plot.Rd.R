library(mosaicModel)


### Name: mod_plot
### Title: Plot out model values
### Aliases: mod_plot

### ** Examples

## Not run: 
##D mod1 <- lm(wage ~ age * sex + sector, data = mosaicData::CPS85)
##D mod_plot(mod1)
##D mod_plot(mod1, n = Inf, interval = "confidence") 
##D mod_plot(mod1, ~ sector + sex + age) # not necessarily a good ordering
##D mod_plot(mod1, ~ age + sex + sector, nlevels = 8) 
##D mod2 <- lm(log(wage) ~ age + sex + sector, data = mosaicData::CPS85)
##D mod_plot(mod2, post_transform = c(wage = exp), 
##D      interval = "confidence") # undo the log in the display
##D mod3 <- glm(married == "Married" ~ age + sex * sector,
##D             data = mosaicData::CPS85, family = "binomial")
##D mod_plot(mod3)
##D E3 <- mod_ensemble(mod3, 10)
##D mod_plot(E3)
##D mod4 <- rpart::rpart(sector ~ age + sex + married, data = mosaicData::CPS85)
##D mod_plot(mod4)
##D mod_plot(mod4, class_level = "manag")
##D mod5 <- randomForest::randomForest(
##D          sector ~ age + sex + married, data = mosaicData::CPS85)
##D mod_plot(mod5)
##D mod_plot(mod5, class_level = "manag")
## End(Not run)



