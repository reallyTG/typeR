library(reghelper)


### Name: cell_means
### Title: Estimated values of a linear model.
### Aliases: cell_means cell_means.lm cell_means.aov cell_means.glm

### ** Examples

# iris data
model <- lm(Sepal.Length ~ Petal.Length + Petal.Width, iris)
summary(model)
cell_means(model, Petal.Length)



