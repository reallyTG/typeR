## ------------------------------------------------------------------------
require(lolR)
require(ggplot2)
n = 400
d = 30
r = 3

## ---- fig.width=5--------------------------------------------------------
testdat <- lol.sims.rtrunk(n, d)
X <- testdat$X
Y <- testdat$Y

data <- data.frame(x1=X[,1], x2=X[,2], y=Y)
data$y <- factor(data$y)
ggplot(data, aes(x=x1, y=x2, color=y)) +
  geom_point() +
  xlab("x1") +
  ylab("x2") +
  ggtitle("Simulated Data")

## ---- fig.width=5--------------------------------------------------------
result <- lol.xval.eval(X, Y, r, alg = lol.project.lol, alg.return="A",
                        classifier=MASS::lda, classifier.return="class", k='loo')

data <- data.frame(x1=result$model$Xr[,1], x2=result$model$Xr[,2], y=Y)
data$y <- factor(data$y)
ggplot(data, aes(x=x1, y=x2, color=y)) +
  geom_point() +
  xlab("x1") +
  ylab("x2") +
  ggtitle(sprintf("Projected Data using LOL, L=%.2f", result$lhat))

## ------------------------------------------------------------------------
result <- lol.xval.optimal_dimselect(X, Y, rs=c(5, 10, 15), alg = lol.project.lol, alg.return="A",
                        classifier=MASS::lda, classifier.return="class", k='loo')

data <- data.frame(x1=result$model$Xr[,1], x2=result$model$Xr[,2], y=Y)
data$y <- factor(data$y)
ggplot(data, aes(x=x1, y=x2, color=y)) +
  geom_point() +
  xlab("x1") +
  ylab("x2") +
  ggtitle(sprintf("Projected Data using LOL, L=%.2f", result$optimal.lhat))

ggplot(result$foldmeans.data, aes(x=r, y=lhat)) +
  geom_line() +
  xlab("Embedding Dimensions, r") +
  ylab("Misclassification Rate, L") +
  ggtitle("Impact on Misclassification Rate of Embedding Dimension")

print(sprintf("optimal dimension: %d", result$optimal.r))
print(sprintf("Misclassification rate at rhat = %d: %.2f", result$optimal.r, result$optimal.lhat))

