library(reghelper)


### Name: beta
### Title: Standardized coefficients of a model.
### Aliases: beta beta.lm beta.aov beta.glm beta.lme beta.merMod

### ** Examples

# iris data, showing use with lm()
model1 <- lm(Sepal.Length ~ Petal.Length + Petal.Width, iris)
beta(model1)  # all three variables standardized

model2 <- lm(Sepal.Width ~ Petal.Width + Species, iris)
beta(model2, skip='Species')  # all variables except Species standardized

# mtcars data, showing use with glm()
model1 <- glm(vs ~ wt + hp, data=mtcars, family='binomial')
beta(model1)  # wt and hp standardized, vs is not by default

# iris data, showing use with lme()
if (require(nlme, quietly=TRUE)) {
    model <- lme(Sepal.Width ~ Sepal.Length + Petal.Length, random=~1|Species, data=iris)
    beta(model)  # all three variables standardized

    beta(model, skip='Petal.Length')  # all variables except Petal.Length standardized
}

# iris data, showing use with lmer()
if (require(lme4, quietly=TRUE)) {
    model <- lmer(Sepal.Width ~ Sepal.Length + Petal.Length + (1|Species), data=iris)
    beta(model)  # all variables standardized

    beta(model, skip='Petal.Length')  # all variables except Petal.Length standardized
}



