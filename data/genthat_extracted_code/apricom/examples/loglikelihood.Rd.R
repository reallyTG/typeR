library(apricom)


### Name: loglikelihood
### Title: Negative 2 log likelihood
### Aliases: loglikelihood

### ** Examples

## Using the mtcars dataset
## Resample, fit an ordinary least squares model and calculate likelihood
data(mtcars)
mtc.data <- cbind(1,datashape(mtcars, y = 8, x = c(1, 6, 9)))
head(mtc.data)
mtc.boot <- randboot(mtc.data, replace = TRUE)
boot.betas <- ml.rgr(mtc.boot)
loglikelihood(b = boot.betas, dataset = mtc.data)



