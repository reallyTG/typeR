library(bnlearn)


### Name: cpquery
### Title: Perform conditional probability queries
### Aliases: cpquery cpdist mutilated
### Keywords: inference simulation

### ** Examples

## discrete Bayesian network (it is the same with ordinal nodes).
data(learning.test)
fitted = bn.fit(hc(learning.test), learning.test)
# the result should be around 0.025.
cpquery(fitted, (B == "b"), (A == "a"))
# programmatically build a conditional probability query...
var = names(learning.test)
obs = 2
str = paste("(", names(learning.test)[-3], " == '",
        sapply(learning.test[obs, -3], as.character), "')",
        sep = "", collapse = " & ")
str
str2 = paste("(", names(learning.test)[3], " == '",
         as.character(learning.test[obs, 3]), "')", sep = "")
str2

cmd = paste("cpquery(fitted, ", str2, ", ", str, ")", sep = "")
eval(parse(text = cmd))
# ... but note that predict works better in this particular case.
attr(predict(fitted, "C", learning.test[obs, -3], prob = TRUE), "prob")
# do the same with likelihood weighting.
cpquery(fitted, event = eval(parse(text = str2)),
  evidence = as.list(learning.test[2, -3]), method = "lw")
attr(predict(fitted, "C", learning.test[obs, -3],
               method = "bayes-lw", prob = TRUE), "prob")
# conditional distribution of A given C == "c".
table(cpdist(fitted, "A", (C == "c")))

## Gaussian Bayesian network.
data(gaussian.test)
fitted = bn.fit(hc(gaussian.test), gaussian.test)
# the result should be around 0.04.
cpquery(fitted,
  event = ((A >= 0) & (A <= 1)) & ((B >= 0) & (B <= 3)),
  evidence = (C + D < 10))

## ideal interventions and mutilated networks.
mutilated(fitted, evidence = list(F = 42))



