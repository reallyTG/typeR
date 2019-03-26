library(rcompanion)


### Name: accuracy
### Title: Minimum maximum accuracy, mean absolute percent error, root mean
###   square error, coefficient of variation, and Efron's pseudo r-squared
### Aliases: accuracy

### ** Examples

data(BrendonSmall)
BrendonSmall$Calories = as.numeric(BrendonSmall$Calories)
BrendonSmall$Calories2 = BrendonSmall$Calories ^ 2
model.1 = lm(Sodium ~ Calories, data = BrendonSmall)
model.2 = lm(Sodium ~ Calories + Calories2, data = BrendonSmall)
model.3 = glm(Sodium ~ Calories, data = BrendonSmall, family="Gamma")
quadplat = function(x, a, b, clx) {
          ifelse(x  < clx, a + b * x   + (-0.5*b/clx) * x   * x,
                           a + b * clx + (-0.5*b/clx) * clx * clx)}
model.4 = nls(Sodium ~ quadplat(Calories, a, b, clx),
              data = BrendonSmall,
              start = list(a=519, b=0.359, clx = 2300))
accuracy(list(model.1, model.2, model.3, model.4), plotit=FALSE)

### Perfect and poor model fits
X = c(1, 2,  3,  4,  5,  6, 7, 8, 9, 10, 11, 12)
Y = c(1, 2,  3,  4,  5,  6, 7, 8, 9, 10, 11, 12)
Z = c(1, 12, 13, 6, 10, 13, 4, 3, 5,  6, 10, 14)
perfect = lm(Y ~ X)
poor    = lm(Z ~ X)
accuracy(list(perfect, poor), plotit=FALSE)




