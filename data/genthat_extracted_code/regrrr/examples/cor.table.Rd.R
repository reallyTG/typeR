library(regrrr)


### Name: cor.table
### Title: make the correlation matrix from the data.frame used in
###   regression
### Aliases: cor.table

### ** Examples

data(mtcars)
model <- lm(mpg ~ vs + carb + hp + wt + wt * hp , data = mtcars)
cor.table(data = model$model)




