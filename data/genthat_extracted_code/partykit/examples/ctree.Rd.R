library(partykit)


### Name: ctree
### Title: Conditional Inference Trees
### Aliases: ctree sctest.constparty
### Keywords: tree

### ** Examples

### regression
airq <- subset(airquality, !is.na(Ozone))
airct <- ctree(Ozone ~ ., data = airq)
airct
plot(airct)
mean((airq$Ozone - predict(airct))^2)

### classification
irisct <- ctree(Species ~ .,data = iris)
irisct
plot(irisct)
table(predict(irisct), iris$Species)

### estimated class probabilities, a list
tr <- predict(irisct, newdata = iris[1:10,], type = "prob")

### survival analysis
if (require("TH.data") && require("survival") && 
    require("coin") && require("Formula")) {

  data("GBSG2", package = "TH.data")
  (GBSG2ct <- ctree(Surv(time, cens) ~ ., data = GBSG2))
  predict(GBSG2ct, newdata = GBSG2[1:2,], type = "response")	  
  plot(GBSG2ct)

  ### with weight-dependent log-rank scores
  ### log-rank trafo for observations in this node only (= weights > 0)
  h <- function(y, x, start = NULL, weights, offset, estfun = TRUE, object = FALSE, ...) {
      if (is.null(weights)) weights <- rep(1, NROW(y))
      s <- logrank_trafo(y[weights > 0,,drop = FALSE])
      r <- rep(0, length(weights))
      r[weights > 0] <- s
      list(estfun = matrix(as.double(r), ncol = 1), converged = TRUE)
  }

  ### very much the same tree
  (ctree(Surv(time, cens) ~ ., data = GBSG2, ytrafo = h))
}

### multivariate responses
airct2 <- ctree(Ozone + Temp ~ ., data = airq)
airct2
plot(airct2)



