library(SQB)


### Name: SQBreg
### Title: SQBreg
### Aliases: SQBreg

### ** Examples

data(hills, package="MASS")
rt.df <- hills[sample(nrow(hills)),]
data.train <- rt.df[1 : (length(rt.df[, 1]) - 1), ]
data.test <- rt.df[-(1 : (length(rt.df[, 1]) - 1)),]
fit <- SQBreg(data.train, data.test, reps = 30, y = "time")
fit




