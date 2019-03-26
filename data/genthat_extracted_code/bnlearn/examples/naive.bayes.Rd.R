library(bnlearn)


### Name: naive.bayes
### Title: Naive Bayes classifiers
### Aliases: naive.bayes tree.bayes predict.bn.naive predict.bn.tan
### Keywords: structure learning classifiers

### ** Examples

data(learning.test)
# this is an in-sample prediction with naive Bayes (parameter learning
# is performed implicitly during the prediction).
bn = naive.bayes(learning.test, "A")
pred = predict(bn, learning.test)
table(pred, learning.test[, "A"])

# this is an in-sample prediction with TAN (parameter learning is
# performed explicitly with bn.fit).
tan = tree.bayes(learning.test, "A")
fitted = bn.fit(tan, learning.test, method = "bayes")
pred = predict(fitted, learning.test)
table(pred, learning.test[, "A"])

# this is an out-of-sample prediction, from a training test to a separate
# test set.
training.set = learning.test[1:4000, ]
test.set = learning.test[4001:5000, ]
bn = naive.bayes(training.set, "A")
fitted = bn.fit(bn, training.set)
pred = predict(fitted, test.set)
table(pred, test.set[, "A"])



