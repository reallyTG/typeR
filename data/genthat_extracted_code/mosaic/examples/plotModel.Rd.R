library(mosaic)


### Name: plotModel
### Title: Plot a regression model
### Aliases: plotModel

### ** Examples


require(mosaic)

mod <- lm( mpg ~ factor(cyl), data = mtcars)
plotModel(mod)

# SLR
mod <- lm( mpg ~ wt, data = mtcars)
plotModel(mod, pch = 19)

# parallel slopes
mod <- lm( mpg ~ wt + factor(cyl), data=mtcars)
plotModel(mod)

## Not run: 
##D  
##D # multiple categorical vars
##D mod <- lm( mpg ~ wt + factor(cyl) + factor(vs) + factor(am), data = mtcars)
##D plotModel(mod)
##D plotModel(mod, mpg ~ am)
##D 
##D # interaction
##D mod <- lm( mpg ~ wt + factor(cyl) + wt:factor(cyl), data = mtcars)
##D plotModel(mod)
##D 
##D # polynomial terms
##D mod <- lm( mpg ~ wt + I(wt^2), data = mtcars)
##D plotModel(mod)
##D 
##D # GLM
##D mod <- glm(vs ~ wt, data=mtcars, family = 'binomial')
##D plotModel(mod)
##D 
##D # GLM with interaction
##D mod <- glm(vs ~ wt + factor(cyl), data=mtcars, family = 'binomial')
##D plotModel(mod)
##D # 3D model
##D mod <- lm( mpg ~ wt + hp, data = mtcars)
##D plotModel(mod)
##D 
##D # parallel planes
##D mod <- lm( mpg ~ wt + hp + factor(cyl) + factor(vs), data = mtcars)
##D plotModel(mod)
##D 
##D # interaction planes
##D mod <- lm( mpg ~ wt + hp + wt * factor(cyl), data = mtcars)
##D plotModel(mod)
##D plotModel(mod, system="g") + facet_wrap( ~ cyl )
## End(Not run)



