context("metapred 3. S3 class and methods.")

### NOTES
# Use 
# opt <- options(warn=2)
# ...
# options(opt)
# When testing locally without testthat.

### TODO
# plot (see the bottom)
# predFUN.
# Tests for options of predict.metapred

### Some stuff necessary for testing
# The data
set.seed(8092017)
n <- 100
n.cov <- 3
td <- data.frame(matrix(rbinom(n * (n.cov + 1), 1, .5), ncol = n.cov + 1, nrow = n))
td.ig <- td + 1 # For inverse gaussian and Gamma.

# Arguments
f <- X1 ~ X2 + X3
gl <- glm(f, family = binomial, data = td)
st.i <- td[["X4"]]
st.u <- sort(unique(st.i))
folds <- metamisc:::l1o(st.u)

### Tests
test_that("metapred handles options", {
  # Stepwise, default
  expect_is(mp <- metamisc:::metapred(data = td, strata = "X4", scope = f, formula = X1 ~ 1, family = binomial), "metapred")
  expect_identical(mp$step.count, 2) # and: stop.reason == no improvement was possible, but that may change.
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))
  
  # Stepwise, stop because of step.count
  expect_is(mp <- metapred(data = td, strata = "X4", scope = f, formula = X1 ~ 1, family = binomial, max.steps = 1), "metapred")
  expect_identical(mp$step.count, 1)
  
  # No stepwise
  expect_is(mp <- metapred(data = td, strata = "X4", scope = f, formula = f, family = binomial), "metapred")
  expect_identical(mp$step.count, 0)
  
  # Possible frequent user mistake: wrong strata variable or it is missing from data.
  # The error below is the intended message. Somehow it is not shown in this test.
  expect_error(mp <- metapred(data = td, strata = "X5", scope = f, formula = f, family = binomial) ) #,
               # "Error in `[.data.frame`(data, , strata) : undefined columns selected")
})

test_that("metapred can handle different perfFUN", {
  expect_is(mp <- metamisc:::metapred(td, strata = "X4", scope = f, formula = f, family = binomial, perfFUN = "auc"
                                      , selFUN = "which.max")
            , "metapred")
})

test_that("metapred can handle multiple genFUN.", {
  genFUN <- list(abs.mean = "abs.mean", coef.var.mean = "coef.var.mean")
  expect_is(mp <- metamisc:::metapred(data = td, strata = "X4", scope = f, formula = f, family = binomial, genFUN = genFUN)
            , "metapred")
  
  genFUN <- list(abs.mean = "abs.mean", nf = function(x, ...) NULL)
  expect_is(mp <- metamisc:::metapred(data = td, strata = "X4", scope = f, formula = f, family = binomial, genFUN = genFUN)
            , "metapred")
  # genFUN <- list(abs.mean = "abs.mean", plot = "plot")
  # 
  # td3 <- rbind(td, td)
  # td3$X4[(nrow(td) + 1):nrow(td3)] <- 2 # necessary for valmeta and forestplot.
  # expect_is(
  #   mp <- metamisc:::metapred(td3, strata = "X4", scope = f, formula = f, family = binomial, perfFUN = "auc", selFUN = "which.max",
  #                                     genFUN = genFUN)
  #           , "metapred")
})

test_that("metapred can handle different distributions.", {
  expect_true(is.list(mp <- metapred(data = td, strata = "X4", family = binomial, max.steps = 0) )) # binomial
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))

  expect_true(is.list(mp <- metapred(data = td, strata = "X4", family = binomial(link = "log"), max.steps = 0))) # binomial, loglink
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))

  expect_true(is.list(mp <- metapred(data = td, strata = "X4", max.steps = 0))) # gaussian
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))

  expect_true(is.list(mp <- metapred(data = td.ig, strata = "X4", family = Gamma, max.steps = 0))) # Gamma
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))

  expect_true(is.list(mp <- metapred(data = td.ig, strata = "X4", family = inverse.gaussian, max.steps = 0))) # inverse.gaussian
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))

  expect_true(is.list(mp <- metapred(data = td, strata = "X4", family = poisson, max.steps = 0))) # poisson
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))

  expect_true(is.list(mp <- metapred(data = td, strata = "X4", family = quasi, max.steps = 0))) # quasi
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))

  expect_true(is.list(mp <- metapred(data = td, strata = "X4", family = quasibinomial, max.steps = 0))) # quasibinomial
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))

  expect_true(is.list(mp <- metapred(data = td, strata = "X4", family = quasipoisson, max.steps = 0))) # quasipoisson
  expect_true(inherits(mp, "metapred"))
  expect_true(is.list(mp$stepwise))
  expect_true(is.list(mp$FUN))
  expect_true(is.call(mp$call))
})

test_that("metapred's stepwise is WAD.", {
  # One is selected due to random fluctuation.
  expect_is(mp <- metamisc:::metapred(data = td, strata = "X4"), "metapred")
  expect_length(coef(mp), 2) 
  
  # None are selected, because the data is pure noise.
  set.seed(324234)
  td.none <- data.frame(matrix(rbinom(n * (n.cov + 1), 1, .5), ncol = n.cov + 1, nrow = n))
  expect_is(mp <- metamisc:::metapred(data = td.none, strata = "X4" ), "metapred") 
  expect_length(coef(mp), 1) 
  
  # All are selected, as predictors are good predictors.
  td.all <- data.frame(matrix(rbinom(n * (n.cov + 1), 1, .5), ncol = n.cov + 1, nrow = n))
  td.all[ , 1] <- rowSums(td.all)
  expect_is(mp <- metamisc:::metapred(data = td.all, strata = "X4" ), "metapred")
  expect_length(coef(mp), 3) 
  
  # All noise predictors are selected, because stepwise = F.
  expect_is(mp <- metamisc:::metapred(data = td.none, strata = "X4", 
                                                formula = f, scope = f ), "metapred")
  expect_length(coef(mp), 3)  
})

# formula of glm is specific for this data, seed and test!
mp <- metapred(data = td, strata = "X2", family = binomial(link = "log"), formula = X3 ~ X1 + X4, center = TRUE)
gl <- glm(formula = X3 ~ X1, data = td, family = binomial(link = "log"))

test_that("metapred S3 methods work.", {
  # Predict
  p <- predict(mp, newdata = td)
  expect_true(is.numeric(p))
  expect_true(all(p <= 1))
  expect_true(all(p >= 0))
  
  # Family
  expect_equal(family(gl), family(mp))
  
  # Formula (test-dependent)
  expect_equal(formula(gl), formula(mp))
  
  # Subset # needs better test: test wether it is best.
  expect_is(subset(mp), "mp.cv")
  expect_is(subset(mp, select = "global"), "mp.global")
  
  # Formula
  # This is to prevent a previous bug from reappearing
  # If the order of formla does not match that of data, it needs to be reordered internally
  # This can give issues when centering.
  expect_is(mp <- metapred(data = td, strata = "X2", formula = X3 ~ X1 + X4, family = binomial, center = TRUE), "metapred")
  
  # coef
  expect_true(is.numeric(coef(mp)))
  expect_equal(length(coef(mp)), n.cov - 1)
})

# # Tests to be added to testthat:
# mp.mse <- metapred(DVTipd.reordered, strata = "cluster", perfFUN = "mse.with.se",
#                    max.steps = 0)
# cv.mse <- subset(mp.mse)
# plot(cv.mse)
# 
# mp.auc <- metapred(DVTipd.reordered, strata = "cluster", perfFUN = "auc",
#                    max.steps = 0)
# cv.auc <- subset(mp.auc)
# plot(cv.auc)
# 
# mp.slo <- metapred(DVTipd.reordered, strata = "cluster", perfFUN = "cal.slope", family = binomial,
#                    max.steps = 0)
# cv.slo <- subset(mp.slo)
# plot(cv.slo)



# This one can be a little annoying
# test_that("print.metapred prints a metapred object", {
#   mp <- metapred(data = td, strata = "X4", family = binomial)
#   cat("\n")
#   print(mp)
# })
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



test_that("metapred estimates models accurately.", {
  
  set.seed(809303) # Somehow I cannot reproduce results if I use the seed defined at the top of the page (outside a testthat function)
  
  # Generate some data
  td <- sampleBinary(n = 1000, J = 4)
  td$clus <- td$X2 + td$X3 + td$X4
  td$X2 <- td$X3 <- td$X4 <- NULL
  
  mp.urma <- metapred(data = td, strata = "clus", max.steps = 0, meta.method = "REML")
  # mp.ufma <- metamisc:::metapred(data = td, strata = "X4", metaFUN = "ufma") # TBI
  mp.mrma <- metapred(data = td, strata = "clus", metaFUN = "mrma", max.steps = 0)
  mp.gl <- glm(Y ~ X1, data = td)
  
  expect_true( abs(coef(mp.urma)[2] - coef(mp.mrma)[2])/ coef(mp.mrma)[2] < .10) # < 10% deviation
  expect_true( abs(coef(mp.mrma)[2] - coef(mp.gl)[2])/ coef(mp.gl)[2] < .10) # < 10% deviation
  
  
  stratified.glm <- function(s) {glm(Y ~ X1, data = td[td$clus %in% s, ])}
  glm.1st.stage <- mapply(stratified.glm, s = sort(unique(td$clus)), SIMPLIFY = F)
  cff.1st.stage <- sapply(glm.1st.stage, coef)
  var.1st.stage <- sapply(glm.1st.stage, function(x){diag(vcov(x))})
  glm.2nd.stage <- metafor::rma(yi = cff.1st.stage[2,],  vi = var.1st.stage[2,], method = "REML")
  
  # 2nd stage coefs:
  expect_equal(glm.2nd.stage$beta[[1]], coef(mp.urma)[[2]]) # No deviation at all.
  
  # 1st stage coefs:
  # No deviation at all.
  mp.urma.1st.stage <- subset(mp.urma, "stratified")
  expect_equal(as.data.frame(coef(mp.urma.1st.stage)), as.data.frame(t(cff.1st.stage)), check.attributes = FALSE) 
})

