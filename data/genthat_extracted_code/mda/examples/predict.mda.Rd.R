library(mda)


### Name: predict.mda
### Title: Classify by Mixture Discriminant Analysis
### Aliases: predict.mda
### Keywords: classif

### ** Examples

data(glass)
samp <- sample(1:nrow(glass), 100)
glass.train <- glass[samp,]
glass.test <- glass[-samp,]
glass.mda <- mda(Type ~ ., data = glass.train)
predict(glass.mda, glass.test, type = "post") # abbreviations are allowed
confusion(glass.mda, glass.test)



