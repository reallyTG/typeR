library(spatstat)


### Name: predict.rppm
### Title: Make Predictions From a Recursively Partitioned Point Process
###   Model
### Aliases: fitted.rppm predict.rppm
### Keywords: spatial models

### ** Examples

    fit <- rppm(unmark(gorillas) ~ vegetation, data=gorillas.extra)
    plot(predict(fit))
    lambdaX <- fitted(fit)
    lambdaX[1:5]
    # Mondriaan pictures
    plot(predict(rppm(redwoodfull ~ x + y)))
    points(redwoodfull)



