library(IMP)


### Name: staticPerfMeasures
### Title: Model evaluation measures for Binary classification models
### Aliases: staticPerfMeasures

### ** Examples

model_1 <- glm(Species ~ Sepal.Length,data=iris,family=binomial)
model_2 <- glm(Species ~ Sepal.Width, data=iris, family = binomial)
df1 <- data.frame(model_1$y,fitted(model_1))
df2 <- data.frame(model_2$y,fitted(model_2))
staticPerfMeasures(list(df1,df2),g=10, perf_measures = c("hosmer","lift"))



