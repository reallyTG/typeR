library(reghelper)


### Name: build_model
### Title: Incremental block modelling.
### Aliases: build_model

### ** Examples

# 2 blocks: Petal.Length; Petal.Length + Petal.Width
model1 <- build_model(Sepal.Length, Petal.Length, Petal.Width, data=iris, model='lm')
summary(model1)
coef(model1)

# 2 blocks: Species; Species + Petal.Length + Petal.Width + Petal.Length:Petal.Width
model2 <- build_model(Sepal.Length, Species, c(Petal.Length * Petal.Width), data=iris, model='lm')
summary(model2)
coef(model2)



