library(rcompanion)


### Name: nagelkerke
### Title: Pseudo r-squared measures for various models
### Aliases: nagelkerke

### ** Examples

### Logistic regression example
data(AndersonBias)
model = glm(Result ~ County + Sex + County:Sex,
           weight = Count,
           data = AndersonBias,
           family = binomial(link="logit"))
nagelkerke(model)

### Quadratic plateau example 
### With nls, the  null needs to be defined
data(BrendonSmall)
quadplat = function(x, a, b, clx) {
          ifelse(x  < clx, a + b * x   + (-0.5*b/clx) * x   * x,
                           a + b * clx + (-0.5*b/clx) * clx * clx)}
model = nls(Sodium ~ quadplat(Calories, a, b, clx),
            data = BrendonSmall,
            start = list(a   = 519,
                         b   = 0.359,
                         clx = 2304))
nullfunct = function(x, m){m}
null.model = nls(Sodium ~ nullfunct(Calories, m),
             data = BrendonSmall,
             start = list(m   = 1346))
nagelkerke(model, null=null.model)




