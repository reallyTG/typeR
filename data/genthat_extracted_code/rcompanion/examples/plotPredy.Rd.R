library(rcompanion)


### Name: plotPredy
### Title: Plot a predicted line from a bivariate model
### Aliases: plotPredy

### ** Examples

### Plot of linear model fit with lm
data(BrendonSmall)
model = lm(Weight ~ Calories, data = BrendonSmall) 
plotPredy(data  = BrendonSmall,
          y     = Weight,
          x     = Calories,
          model = model,
          xlab  = "Calories per day",
          ylab  = "Weight in kilograms")
           
### Plot of polynomial model fit with lm
data(BrendonSmall)
BrendonSmall$Calories2 = BrendonSmall$Calories * BrendonSmall$Calories
model = lm(Sodium ~ Calories + Calories2, data = BrendonSmall) 
plotPredy(data  = BrendonSmall,
          y     = Sodium,
          x     = Calories,
          x2    = Calories2,
          model = model,
          order = 2,
          xlab  = "Calories per day",
          ylab  = "Sodium intake per day")

### Plot of quadratic plateau model fit with nls
data(BrendonSmall)
quadplat = function(x, a, b, clx) {
          ifelse(x  < clx, a + b * x   + (-0.5*b/clx) * x   * x,
                           a + b * clx + (-0.5*b/clx) * clx * clx)}
model = nls(Sodium ~ quadplat(Calories, a, b, clx),
            data = BrendonSmall,
            start = list(a   = 519,
                         b   = 0.359,
                         clx = 2304))
plotPredy(data  = BrendonSmall,
          y     = Sodium,
          x     = Calories,
          model = model,
          xlab  = "Calories per day",
          ylab  = "Sodium intake per day")

### Logistic regression example requires type option
data(BullyHill)
Trials = cbind(BullyHill$Pass, BullyHill$Fail)
model.log = glm(Trials ~ Grade, data = BullyHill,
                family = binomial(link="logit"))
plotPredy(data  = BullyHill,
          y     = Percent,
          x     = Grade,
          model = model.log,
          type  = "response",
          xlab  = "Grade",
          ylab  = "Proportion passing")




