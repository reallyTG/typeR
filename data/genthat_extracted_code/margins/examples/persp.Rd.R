library(margins)


### Name: image.lm
### Title: Perspective and heatmap/contour plots for models
### Aliases: image.lm image.glm image.loess persp.lm persp.glm persp.loess
### Keywords: graphics hplot

### ** Examples

## Not run: 
##D   require('datasets')
##D   # prediction from several angles
##D   m <- lm(mpg ~ wt*drat, data = mtcars)
##D   persp(m, theta = c(45, 135, 225, 315))
##D 
##D   # flat/heatmap representation
##D   image(m)
##D 
##D   # marginal effect of 'drat' across drat and wt
##D   m <- lm(mpg ~ wt*drat*I(drat^2), data = mtcars)
##D   persp(m, xvar = "drat", yvar = "wt", what = "effect", 
##D         nx = 10, ny = 10, ticktype = "detailed")
##D 
##D   # a non-linear model
##D   m <- glm(am ~ wt*drat, data = mtcars, family = binomial)
##D   persp(m, theta = c(30, 60)) # prediction
##D   # flat/heatmap representation
##D   image(m)
##D 
##D   # effects on linear predictor and outcome
##D   persp(m, xvar = "drat", yvar = "wt", what = "effect", type = "link")
##D   persp(m, xvar = "drat", yvar = "wt", what = "effect", type = "response")
## End(Not run)




