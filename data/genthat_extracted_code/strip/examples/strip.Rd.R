library(strip)


### Name: strip
### Title: Lighten R model outputs
### Aliases: strip strip_ strip_.default strip_.gam strip_.glm
###   strip_.kmeans strip_.lm strip_.loess strip_.randomForest strip_.train

### ** Examples

data("mtcars")
set.seed(110)
i = sample(2, nrow(mtcars), replace = TRUE, prob=c(0.8, 0.2))
r1 = lm(mpg ~ ., data = mtcars[i==1,])
r2 = strip(r1, keep = "predict")

# Estimate the objects' size as the size of their serialization
length(serialize(r1, NULL))
length(serialize(r2, NULL))

# Check that predictions are the same
p1 = predict(r1, newdata = mtcars[i==2,])
p2 = predict(r2, newdata = mtcars[i==2,])
identical(p1, p2) # TRUE




