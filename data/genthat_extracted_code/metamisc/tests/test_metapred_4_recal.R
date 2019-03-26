context("metapred 4. recalibrate")


### Some stuff necessary for testing
set.seed(8092017)
n <- 100
n.cov <- 3
d  <- data.frame(matrix(rbinom(n * (n.cov + 1), 1, .7), ncol = n.cov + 1, nrow = n))
d2 <- data.frame(matrix(rbinom(n * (n.cov + 1), 1, .5), ncol = n.cov + 1, nrow = n))
d3 <- data.frame(matrix(rbinom(n * (n.cov + 1), 1, .5), ncol = n.cov + 1, nrow = n))

### Tests
test_that("computeRecal recalibrates", {
  g <- glm(d, family = binomial)
  expect_true(is.numeric(r.int <- metamisc:::computeRecal(g, newdata = d2, estFUN = glm)))
  expect_true(r.int[[1]] <= 0)
})

test_that("recalibrate recalibrates", {
  ### basically recalibrate.glm
  g <- glm(d, family = binomial)
  expect_true(is.list(r <- metamisc:::recalibrate(g, d2)))
  expect_true(inherits(r, "glm"))
  r.int <- metamisc:::computeRecal(r, newdata = d2, estFUN = glm)
  expect_equal(r.int[[1]], 0) # ComputeInt after recalibrate should have no added effect.

  ### basically recalibrate.metapred
  mp <- metamisc:::metapred(d2, strata = "X4", recal.int = FALSE)
  mp.r <- metamisc:::recalibrate(mp, newdata = d2) # ignores clustering. Hence, intercept changes.
  expect_true(is.list(mp.r))
  expect_true(inherits(mp.r, "metapred"))
})


# To be replaced!!!!!!!!!!!
# test_that("metapred with recal.int = T works.", {
#   mp.t <- metamisc:::metapred(d, strata = "X4", recal.int = TRUE)
#   # expect_true(is.list(mp.t$stepwise$coef.recal))
# 
#   mp.f <- metamisc:::metapred(d, strata = "X4", recal.int = FALSE)
#   # expect_true(is.null(mp.f$stepwise$coef.recal))
# })

test_that("predict.metapred with recal.int = T works.", {
  mp.f <- metamisc:::metapred(d, strata = "X4", recal.int = FALSE)
  expect_true(is.numeric(p <- predict(object = mp.f, newdata = d2, recal.int = TRUE)))
  expect_true(all(p <= 1))
  expect_true(all(p >= 0))

  mp.f <- metamisc:::metapred(d3, strata = "X4", recal.int = FALSE)
  expect_true(is.numeric(p <- predict(object = mp.f, newdata = d2, recal.int = TRUE)))
  expect_true(all(p <= 1))
  expect_true(all(p >= 0))

  expect_true(is.numeric(p2 <- predict(object = mp.f, newdata = d2, recal.int = FALSE)))
  expect_true(all(p2 <= 1))
  expect_true(all(p2 >= 0))

  # expect_false(all(p == p2)) 
  # expect_true(all(p != p2)) # With this seed. (Test with new version!)
})

######################

sampleBinary <- function(n = 50, J = 1, b = rep(log(2), J), alpha = NULL, col.names = NULL ) {
  J <- length(b)
  if (is.null(alpha)) alpha <- -log(sqrt(prod(exp(b))))
  if (is.null(col.names)) col.names <- c("Y", paste("X", 1:J, sep = ""))
  coefficientss <- c(alpha, b)
  x  <- cbind(1, matrix(rbinom(n * J, size = 1, prob = .5), nrow = n, ncol = J))
  lp <- coefficientss %*% t(x)
  p  <- metamisc:::inv.logit(lp)
  y  <- stats::rbinom(length(lp), size = 1, prob = p)

  out <- data.frame(cbind(y,x[ , -1]))
  colnames(out) <- col.names
  out
}

#####
set.seed(2039420)
n <- 1000
d4 <- sampleBinary(n, b = c(.3, .4, -.5, -.6), alpha = .2)
d5 <- sampleBinary(n, b = c(.3, .4, -.5, -.6), alpha = .7)
d6 <- sampleBinary(n, b = c(-.3, -.4, .5, -.6), alpha = .4)



g4 <- glm(d4, family = binomial)
g5 <- glm(d5, family = binomial)


test_that("recalibrate recalibrates glm accurately.", {
  g5$coefficients[c(2,4)] <- g4$coefficients[c(2,4)]
  expect_true(!isTRUE(all.equal(coefficients(g4), coefficients(g5)))) # As they are different models
  
  g5.recal.int <- metamisc:::recalibrate(g5, newdata = d4)
  expect_true(!isTRUE(all.equal(coefficients(g4), coefficients(g5.recal.int)))) # As only intercept should be updated
  expect_true(!isTRUE(all.equal(coefficients(g4)[1], coefficients(g5.recal.int)[1]))) # Due to different coefficientss, intercept should still be different.
  
  g5.recal.all <- metamisc:::recalibrate(g5, newdata = d4, f = formula(d4))
  expect_true(all.equal(coefficients(g4), coefficients(g5.recal.all))) # NOW, all have been updated.
  
  g5$coefficients[-1] <- g4$coefficients[-1]
  g5.recal.int2 <- metamisc:::recalibrate(g5, newdata = d4)
  expect_true(all.equal(coefficients(g4), coefficients(g5.recal.int2))) # Now, only the intercept needs to be updated.
})


# shrink(g4, d6, method = "bs") # should be negative, as d6 created with opposite coefficientss
# shrink(g4, d5) # should be 0 < slope < 1

########## pred.recal
test_that("recalibrate recalibrates glm's accurately.", {
  gl.recal <-  metamisc:::pred.recal(predict(g4, type = "response"), d4[, 1], "glm", binomial)
  int.recal <- (gl.recal)[[1]][[1]]
  se(gl.recal)
  suppressMessages(confint(gl.recal))
  expect_equal(int.recal, 0) # intercept recalibration works.
  
  gl.recal <- metamisc:::pred.recal(predict(g4, type = "response"), d4[, 1], "glm", binomial, which = "slope")
  se(gl.recal)
  suppressMessages(confint(gl.recal))
  slo.recal <- gl.recal[[1]][2]
  expect_equal(slo.recal, c(lp = 1)) # Perfect
  
  gl.recal <- metamisc:::pred.recal(predict(g4, type = "response"), d4[, 1], "glm", binomial, which = "add.slope")
  se(gl.recal)
  suppressMessages(confint(gl.recal))
  slo.recal <- gl.recal[[1]][2]
  expect_equal(slo.recal, c(lp = 0)) #
})






# # Deprecated
# test_that("computeInt recalibrates", {
#   g <- glm(d, family = binomial)
#   expect_true(is.numeric(r.int <- metamisc:::computeInt(g, newdata = d5, estFUN = glm, family = binomial)))
#   expect_true(r.int[[1]] <= coefficients(g)[1])
# })

# library(MASS)
#
# sampleBinaryMVN <- function(n, b, s = NULL) {
#   if (is.null(s)) {
#     s <- matrix(0, ncol = length(b) - 1, nrow = length(b) - 1)
#     diag(s) <- 1
#   }
#   x <- cbind(1, MASS::mvrnorm(n = n, rep(0, nrow(s)), s, empirical = TRUE))
#   lp <- x %*% b
#   p <- metamisc:::inv.logit(lp)
#   y <- stats::rbinom(n, 1, p)
#   cbind(y,data.frame(x[ , -1]))
# }

