library(IMP)


### Name: staticConfMatrix
### Title: Confusion Matrix for Binary Classification Models
### Aliases: staticConfMatrix

### ** Examples

model_1 <- glm(Species ~ Sepal.Length,data=iris,family=binomial)
model_2 <- glm(Species ~ Sepal.Width, data=iris, family = binomial)
df1 <- data.frame(model_1$y,fitted(model_1))
df2 <- data.frame(model_2$y,fitted(model_2))
staticConfMatrix(list(df1,df2),t=0.2)



