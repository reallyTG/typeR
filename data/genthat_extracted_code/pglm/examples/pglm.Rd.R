library(pglm)


### Name: pglm
### Title: Panel Estimators for Generalized Linear Models
### Aliases: pglm ordinal negbin
### Keywords: regression

### ** Examples

## an ordered probit example
data('Fairness', package = 'pglm')
Parking <- subset(Fairness, good == 'parking')
op <- pglm(as.numeric(answer) ~ education + rule,
           Parking[1:105, ],
           family = ordinal('probit'), R = 5, print.level = 3,
           method = 'bfgs', index = 'id',  model = "random")

## a binomial (logit) example
data('UnionWage', package = 'pglm')
anb <- pglm(union ~ wage + exper + rural, UnionWage, family = binomial('probit'),
            model = "pooling",  method = "bfgs", print.level = 3, R = 5)

## a gaussian example on unbalanced panel data
data(Hedonic, package = "plm")
ra <- pglm(mv ~ crim + zn + indus + nox + age + rm, Hedonic, family = gaussian,
           model = "random", print.level = 3, method = "nr", index = "townid")

## some count data models
data("PatentsRDUS", package="pglm")
la <- pglm(patents ~ lag(log(rd), 0:5) + scisect + log(capital72) + factor(year), PatentsRDUS,
           family = negbin, model = "within", print.level = 3, method = "nr",
           index = c('cusip', 'year'))
la <- pglm(patents ~ lag(log(rd), 0:5) + scisect + log(capital72) + factor(year), PatentsRDUS,
           family = poisson, model = "pooling", index = c("cusip", "year"),
           print.level = 0, method="nr")

## a tobit example
data("HealthIns", package="pglm")
HealthIns$med2 <- HealthIns$med / 1000
HealthIns2 <- HealthIns[-2209, ]
set.seed(2)
subs <- sample(1:20186, 200, replace = FALSE)
HealthIns2 <- HealthIns2[subs, ]
la <- pglm(med ~ mdu + disease + age, HealthIns2,
           model = 'random', family = 'tobit', print.level = 0,
           method = 'nr', R = 5)



