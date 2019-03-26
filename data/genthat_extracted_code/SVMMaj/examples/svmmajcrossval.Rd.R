library(SVMMaj)


### Name: svmmajcrossval
### Title: k-fold Cross-Validation of SVM-Maj
### Aliases: svmmajcrossval

### ** Examples


Xt <- diabetes$X
yt <- diabetes$y

## performing gridsearch with k-fold cross-validation
results <- svmmajcrossval(
   Xt, yt, 
  scale = 'interval',
  mc.cores = 2,
  ngroup = 5,
  return.model = TRUE
)

summary(results$model)
results
plot(results)
plot(results, 'profile')



