library(bnlearn)


### Name: impute
### Title: Predict or impute missing data from a Bayesian network
### Aliases: impute predict.bn.fit
### Keywords: inference missing data data preprocessing

### ** Examples

# missing data imputation.
with.missing.data = gaussian.test
with.missing.data[sample(nrow(with.missing.data), 500), "F"] = NA
fitted = bn.fit(model2network("[A][B][E][G][C|A:B][D|B][F|A:D:E:G]"),
           gaussian.test)
imputed = impute(fitted, with.missing.data)

# predicting a variable in the test set.
training = bn.fit(model2network("[A][B][E][G][C|A:B][D|B][F|A:D:E:G]"),
           gaussian.test[1:2000, ])
test = gaussian.test[2001:nrow(gaussian.test), ]
predicted = predict(training, node = "F", data = test)

# obtain the conditional probabilities for the values of a single variable
# given a subset of the rest, they are computed to determine the predicted
# values.
fitted = bn.fit(model2network("[A][C][F][B|A][D|A:C][E|B:F]"), learning.test)
evidence = data.frame(A = factor("a", levels = levels(learning.test$A)),
                      F = factor("b", levels = levels(learning.test$F)))
predicted = predict(fitted, "C", evidence,
              method = "bayes-lw", prob = TRUE)
attr(predicted, "prob")



