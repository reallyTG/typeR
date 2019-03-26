library(emmeans)


### Name: joint_tests
### Title: Compute joint tests of the terms in a model
### Aliases: joint_tests

### ** Examples

pigs.lm <- lm(log(conc) ~ source * factor(percent), data = pigs)

joint_tests(pigs.lm)                     ## will be same as type III ANOVA

joint_tests(pigs.lm, weights = "outer")  ## differently weighted

joint_tests(pigs.lm, by = "source")      ## separate joint tests of 'percent'

### Comparisons with type III tests
toy = data.frame(
    treat = rep(c("A", "B"), c(4, 6)),
    female = c(1, 0, 0, 1,   0, 0, 0, 1, 1, 0 ),
    resp = c(17, 12, 14, 19, 28, 26, 26, 34, 33, 27))
toy.fac = lm(resp ~ treat * factor(female), data = toy)
toy.cov = lm(resp ~ treat * female, data = toy)
# (These two models have identical fitted values and residuals)

joint_tests(toy.fac)

joint_tests(toy.cov)                      # ref grid uses mean(female) = 0.4
joint_tests(toy.cov, cov.reduce = FALSE)  # ref grid uses female = c(0, 1) 
joint_tests(toy.cov, at = list(female = c(-1, 1)))  # center on intercept

# -- Compare with SAS output -- female as factor --
## Source          DF    Type III SS    Mean Square   F Value   Pr > F
## treat            1    488.8928571    488.8928571    404.60   <.0001
## female           1     78.8928571     78.8928571     65.29   0.0002
## treat*female     1      1.7500000      1.7500000      1.45   0.2741
# 
# -- Compare with SAS output -- female as covariate --
## Source          DF    Type III SS    Mean Square   F Value   Pr > F
## treat            1    252.0833333    252.0833333    208.62   <.0001
## female           1     78.8928571     78.8928571     65.29   0.0002
## female*treat     1      1.7500000      1.7500000      1.45   0.2741



