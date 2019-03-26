library(randomForestSRC)


### Name: quantileReg
### Title: Quantile Regression Forests
### Aliases: quantileReg quantileReg.rfsrc
### Keywords: quantile regression forests

### ** Examples

## No test: 
## ------------------------------------------------------------
## regression example
## ------------------------------------------------------------

## standard call
o <- quantileReg(mpg ~ ., mtcars)
qo <- o$quantileReg

## calculate the conditional mean, compare to OOB predicted value
## note that the conditional mean is returned as "yhat"
c.mean <- qo$density %*% qo$yunq
print(data.frame(c.mean = c.mean, yhat = qo$yhat, pred.oob = o$predicted.oob))

## calculate conditional standard deviation
c.std <- sqrt(qo$density %*% qo$yunq^2 - c.mean ^ 2)
quant <- qo$quantile
colnames(quant) <- paste("q", 100 * qo$prob, sep = "")
print(data.frame(quant, c.std))


## ------------------------------------------------------------
## train/test regression example
## ------------------------------------------------------------

## train (grow) call followed by test call
trn <- quantileReg(mpg ~ ., mtcars[1:20,])
test <- quantileReg(object = trn, newdata = mtcars[-(1:20),-1])

## calculate test set conditional mean and standard deviation
qo <- test$quantileReg
c.mean <- qo$density %*% qo$yunq
c.std <- sqrt(qo$density %*% qo$yunq^2 - c.mean ^ 2)
quant <- qo$quant
colnames(quant) <- paste("q", 100 * qo$prob, sep = "")
print(data.frame(quant, c.mean, c.std))


## ------------------------------------------------------------
## multivariate mixed outcomes example
## ------------------------------------------------------------

dta <- mtcars
dta$cyl <- factor(dta$cyl)
dta$carb <- factor(dta$carb, ordered = TRUE)
o <- quantileReg(cbind(carb, mpg, cyl, disp) ~., data = dta)

print(head(o$quantileReg$mpg$quant))
print(head(o$quantileReg$disp$quant))


## ------------------------------------------------------------
## quantile regression plot for Boston Housing data
## ------------------------------------------------------------

if (library("mlbench", logical.return = TRUE)) {

  ## apply quantile regression to Boston Housing data
  data(BostonHousing)
  o <- quantileReg(medv ~ ., BostonHousing, nodesize = 1)
  y <- o$yvar
  qo <- o$quantileReg

  ## pull desired quantiles - nice little wrapper for doing this
  get.quantile <- function(q, target.prob) {
    target.prob <- sort(unique(target.prob))
    q.dta <- do.call(cbind, lapply(target.prob, function(pr) {
      q$quant[, which.min(abs(pr - q$prob))]
    }))
    colnames(q.dta) <-  paste("q.", 100 * target.prob, sep = "")
    q.dta
   }

  ## extract 25,50,75 quantiles
  quant.dat <- get.quantile(qo, c(.25, .50, .75))
  
  ## quantile regression plot
  plot(range(y), range(quant.dat), xlab = "y",
       ylab = ".25-.75 Quantiles", type = "n")
  jitter.y <- jitter(y, 10)
  points(jitter.y, quant.dat[, 2], pch = 15, col = 4, cex = 0.75)
  segments(jitter.y, quant.dat[, 2], jitter.y, quant.dat[, 1], col = "grey")
  segments(jitter.y, quant.dat[, 2], jitter.y, quant.dat[, 3], col = "grey")
  points(jitter.y, quant.dat[, 1], pch = "-", cex = 1)
  points(jitter.y, quant.dat[, 3], pch = "-", cex = 1)
  abline(0, 1, lty = 2, col = 2)

  ## compare 25-75 percentiles to values expected under normality
  c.mean <- qo$density %*% qo$yunq
  c.std <- sqrt(qo$density %*% qo$yunq^2 - c.mean ^ 2)
  q.25.est <- c.mean + qnorm(.25) * c.std
  q.75.est <- c.mean + qnorm(.75) * c.std
  print(head(data.frame(quant.dat[, -2],  q.25.est, q.75.est)))

  ## compare performance of quantile regression estimator to
  ## standard random forest estimator of averaged tree mean
  cat("quantile regression yhat error:", mean((o$yvar-qo$yhat)^2), "\n")
  cat("RF averaged tree mean error:", mean((o$yvar-o$predicted.oob)^2), "\n")


}

## ------------------------------------------------------------
## example of quantile regression for ordinal data
## ------------------------------------------------------------

 ## use the wine data for illustration
 data(wine, package = "randomForestSRC")

 ## run quantile regression
 o <- quantileReg(quality ~ ., wine, ntree = 100)

 ## extract "probabilities" = density values
 qo <- o$quantileReg
 yunq <- qo$yunq
 yvar <- factor(cut(o$yvar, c(-1, yunq), labels = yunq)) 
 qo.dens <- qo$density
 colnames(qo.dens) <- yunq 
 qo.class <- randomForestSRC:::bayes.rule(qo.dens)
 qo.confusion <- table(yvar, qo.class)
 qo.err <- 1 - diag(qo.confusion) / rowSums(qo.confusion)
 qo.confusion <- cbind(qo.confusion, qo.err)
 print(qo.confusion)
 cat("Normalized Brier:", 100 * randomForestSRC:::brier(yvar, qo.dens), "\n")

## End(No test)


