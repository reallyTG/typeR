### R code from vignette source 'paper.Rnw'

###################################################
### code chunk number 1: R session setup
###################################################
options(prompt="R> ")
options(mc.cores = 2)


###################################################
### code chunk number 2: Hingeplot
###################################################
library(SVMMaj)
library(ggplot2)
library(reshape2)
hinges <- sapply(
  c("absolute", "quadratic", "huber"),
  getHinge, delta = 2
)
q <- seq(-4, 2, by = 0.1)
output <- data.frame(
  q,
  sapply(hinges, function(fun) fun(q, 1)$loss)
)
names(output) <- c("q", "Absolute hinge", "Quadratic hinge",  "Huber hinge \n(delta = 2)")

ggplot(melt(output, id.vars = "q")) +
  geom_line(aes(x = q, y = value)) + 
  facet_grid(~ variable) +
  ylim(0,8) +
  xlab(expression(widetilde(q[i]))) +
  ylab("error term class 1") +
  theme_bw()



###################################################
### code chunk number 3: svmmaj usage (eval = FALSE)
###################################################
## svmmaj(X, y, lambda = 2, hinge = "quadratic", scale = "interval")


###################################################
### code chunk number 4: svmmajcrossval usage (eval = FALSE)
###################################################
## svmmajcrossval(X, y, search.grid = list(lambda = c(1, 2, 4)))


###################################################
### code chunk number 5: Package load
###################################################
library("SVMMaj")


###################################################
### code chunk number 6: svmmaj example
###################################################
model <- svmmaj(AusCredit.tr$X, AusCredit.tr$y, lambda = 100)
model


###################################################
### code chunk number 7: modelplot
###################################################
plot(model)


###################################################
### code chunk number 8: model summary
###################################################
summary(model)


###################################################
### code chunk number 9: predict output
###################################################
predict(model, AusCredit.te$X)


###################################################
### code chunk number 10: Predict output with observed
###################################################
predict(model, AusCredit.te$X, AusCredit.te$y)


###################################################
### code chunk number 11: Predictmodelplot
###################################################
predict(model, AusCredit.te$X, AusCredit.te$y, show.plot = TRUE)


###################################################
### code chunk number 12: Model parameters
###################################################
model <- svmmaj(AusCredit.tr$X, AusCredit.tr$y, scale = 'none', lambda = 100)
alpha <- model$theta[1]
beta  <- model$beta
qu  <-  drop(alpha + data.matrix(AusCredit.te$X) %*% beta)


###################################################
### code chunk number 13: Model parameters to label
###################################################
y <- factor(qu < 0, levels = c(TRUE, FALSE), labels = model$classes)


###################################################
### code chunk number 14: Package load pt 2
###################################################
library("SVMMaj")


###################################################
### code chunk number 15: svmmajcrossval absolute hinge example
###################################################
results.absolute <- svmmajcrossval(
  voting.tr$X, voting.tr$y, 
  search.grid = list(lambda = 10^seq(4, -4)),
  hinge = "absolute", convergence = 1e-4)
model <- svmmaj(
  voting.tr$X, voting.tr$y, hinge = "absolute", 
  lambda = results.absolute$param.opt$lambda)
q.absolute <- predict(model, voting.te$X, voting.te$y)


###################################################
### code chunk number 16: svmmajcrossval quadratic hinge example
###################################################
results.quadratic <- svmmajcrossval(
  voting.tr$X, voting.tr$y,
  search.grid = list(lambda = 10^seq(4, -2, length.out = 11)),
  hinge = "quadratic", convergence = 1e-4)
model <- svmmaj(
  voting.tr$X, voting.tr$y, hinge = "quadratic",
  lambda = results.quadratic$param.opt$lambda)
q.quadratic <- predict(model, voting.te$X, voting.te$y)


###################################################
### code chunk number 17: svmmajcrossvalresultscompare
###################################################
library(gridExtra)
grid.arrange(
  plot(results.absolute) + 
    ggtitle("Absolute hinge") + 
    ylab("Misclassification rate") +
    ylim(0, 1),
  plot(results.quadratic) +
    ggtitle("Quadratic hinge") + 
    ylab("Misclassification rate") +
    ylim(0, 1),
  ncol = 2
)


###################################################
### code chunk number 18: svmmajcrossval result
###################################################
library(xtable)

values <- data.frame(
  " " = c("CPU-time (sec)", "Mean no. of iter",
         "CPU-time (per iter)", "Optimal p", 
         "Hit rate (average TP)"),
  'Absolute'  = rep(0, 5),
  'Quadratic' = rep(0, 5),
  check.names = FALSE
)

time.quadratic <- system.time(
  results.quadratic <- svmmajcrossval(
    voting.tr$X, voting.tr$y,
    search.grid = list(lambda = 10^seq(4, -2, length.out = 11)),
    hinge = "quadratic")
)

time.absolute <- system.time(
  results.absolute <- svmmajcrossval(
    voting.tr$X, voting.tr$y, 
    search.grid = list(lambda = 10^seq(4, -2, length.out = 11)),
    hinge = "absolute")
)

values$Absolute <- c(
  time.absolute[['elapsed']], results.absolute$iter,
  time.absolute[['elapsed']] / results.absolute$iter,
  log(results.absolute$param.opt$lambda) / log(10),
  mean((results.absolute$qhat < 0) ==  (attr(results.absolute$qhat, 'y') < 0))
)

values$Quadratic <- c(
  time.quadratic[['elapsed']], results.quadratic$iter,
  time.quadratic[['elapsed']] / results.quadratic$iter,
  log(results.quadratic$param.opt$lambda) / log(10),
  mean((results.quadratic$qhat < 0) == (attr(results.quadratic$qhat, 'y') < 0))
)

rownames(values) <- NULL
table <- xtable(
  values,
  label = "tab:cv",
  caption = "Results of the fivefold cross validation estimation using the \\texttt{svmcrossval} function. CPU-time is the time in CPU seconds needed to perform fivefold cross validation and Optimal $p$ the value of which $10^p$ returns the best hit rate in the cross validation. Mean no. of iterations denotes the average value of the sum of the number of iterations per \\texttt{lambda}-value. CPU-time per iter is the mean computation time needed to perform one iteration. Hit rate is the average TP value by predicting the class labels of the holdout sample of 134 congress men using the first 300 congress men as sample of estimation."
)
  
print(table, include.rownames = FALSE)


###################################################
### code chunk number 19: svmmajcrossval spline example
###################################################
results.spline <- svmmajcrossval(
  diabetes.tr$X, diabetes.tr$y,
  scale = "interval", search.grid = list(lambda = 10^seq(6, -6)),
  hinge = "quadratic", spline.knots = 5, spline.degree = 2,
  weights.obs = list(positive = 2, negative = 1))
model.spline <- svmmaj(
  diabetes.tr$X, diabetes.tr$y,
  scale = "interval", lambda = results.spline$param.opt$lambda,
  spline.knots = 5, spline.degree = 2, hinge = "quadratic",
  weights.obs = list(positive = 2, negative = 1))
predict(
  model.spline, diabetes.te$X, diabetes.te$y,
  weights = list(positive = 2, negative = 1))


###################################################
### code chunk number 20: splineweightsplot
###################################################
plotWeights(model.spline)


###################################################
### code chunk number 21: svmmajcrossval kernel example
###################################################
library(kernlab)
results.kernel <- svmmajcrossval(
  diabetes.tr$X, diabetes.tr$y,
  scale = "interval", 
  search.grid = list(
    kernel.sigma = 2^seq(-4, 4, by = 2),
    lambda = 10^seq(-4, 4, by = 2)
  ), hinge = "quadratic", kernel = rbfdot,
  weights.obs = list(positive = 2, negative = 1),
  options = list(convergence = 1e-4))
model.kernel <- svmmaj(
  diabetes.tr$X, diabetes.tr$y,
  scale = "interval", lambda = results.kernel$param.opt$lambda,
  kernel.sigma = results.kernel$param.opt$kernel.sigma,
  kernel = rbfdot, hinge = "quadratic",
  weights.obs = list(positive = 2, negative = 1))
predict(
  model.kernel, diabetes.te$X, diabetes.te$y,
  weights = list(positive = 2, negative = 1))


