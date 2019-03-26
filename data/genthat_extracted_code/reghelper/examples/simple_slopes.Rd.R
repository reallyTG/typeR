library(reghelper)


### Name: simple_slopes
### Title: Simple slopes of an interaction.
### Aliases: simple_slopes simple_slopes.lm simple_slopes.aov
###   simple_slopes.glm simple_slopes.lme simple_slopes.merMod

### ** Examples

# linear model
mtcars$am <- factor(mtcars$am)  # make 'am' categorical
model <- lm(mpg ~ wt * am, data=mtcars)
summary(model)  # significant interaction
simple_slopes(model)
simple_slopes(model,
    levels=list(wt=c(2, 3, 4, 'sstest'), am=c(0, 1, 'sstest')))  # test at specific levels

# generalized linear model
model <- glm(vs ~ gear * wt, data=mtcars, family='binomial')
summary(model)  # marginal interaction
simple_slopes(model)
simple_slopes(model,
    levels=list(gear=c(2, 3, 4, 'sstest'), wt=c(2, 3, 'sstest')))  # test at specific levels

# hierarchical linear model (nlme)
if (require(nlme, quietly=TRUE)) {
    model <- lme(Sepal.Width ~ Sepal.Length * Petal.Length, random=~1|Species, data=iris)
    summary(model)  # significant interaction
    simple_slopes(model)
    simple_slopes(model,
        levels=list(Sepal.Length=c(4, 5, 6, 'sstest'),
        Petal.Length=c(2, 3, 'sstest')))  # test at specific levels
}

# hierarchical linear model (lme4)
if (require(lme4, quietly=TRUE)) {
    model <- lmer(Sepal.Width ~ Sepal.Length * Petal.Length + (1|Species), data=iris)
    summary(model)
    simple_slopes(model)
    simple_slopes(model,
        levels=list(Sepal.Length=c(4, 5, 6, 'sstest'),
        Petal.Length=c(2, 3, 'sstest')))  # test at specific levels
}



