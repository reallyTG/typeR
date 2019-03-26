library(emil)


### Name: roc_curve
### Title: Calculate ROC curves
### Aliases: roc_curve as.data.table.roc_curve as.data.frame.roc_curve
###   plot.roc_curve

### ** Examples

# Generate some noisy data
my.data <- iris
my.data[1:4] <- my.data[1:4] + 2*rnorm(150*4)

# Train and evaluate some classifiers
procedure <- list(lda = modeling_procedure("lda"),
                  qda = modeling_procedure("qda"))
cv <- resample("crossvalidation", iris$Species, nrep=1, nfold=3)
result <- evaluate(procedure, my.data[-5], my.data$Species, resample=cv)

# Study the performance
select(result, fold=TRUE, method=TRUE, error="error")
roc <- roc_curve(result, my.data$Species, cv)
plot(roc)



