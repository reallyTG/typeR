library(modelr)


### Name: crossv_mc
### Title: Generate cross-validated test-training pairs
### Aliases: crossv_mc crossv_kfold

### ** Examples

cv1 <- crossv_kfold(mtcars, 5)
cv1

library(purrr)
cv2 <- crossv_mc(mtcars, 100)
models <- map(cv2$train, ~ lm(mpg ~ wt, data = .))
errs <- map2_dbl(models, cv2$test, rmse)
hist(errs)



