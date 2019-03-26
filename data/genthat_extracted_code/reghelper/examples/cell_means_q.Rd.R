library(reghelper)


### Name: cell_means_q
### Title: Estimated values of a linear model.
### Aliases: cell_means_q cell_means_q.lm cell_means_q.aov cell_means_q.glm

### ** Examples

# iris data
model <- lm(Sepal.Length ~ Petal.Length + Petal.Width, iris)
summary(model)
cell_means_q(model, 'Petal.Length')



