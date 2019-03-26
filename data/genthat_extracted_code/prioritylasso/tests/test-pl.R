set.seed(1234)
pl1a <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                      blocks = list(block1=1:75, block2=76:200, block3=201:500),
                      block1.penalization = TRUE, lambda.type = "lambda.1se", standardize = TRUE, nfolds = 5)

set.seed(1234)
pl1b <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                      blocks = list(block1=1:15, block2=16:200, block3=201:500),
                      block1.penalization = FALSE, lambda.type = "lambda.1se", standardize = TRUE, nfolds = 5)

###

set.seed(1234)
pl1 <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                     blocks = list(block1=1:75, block2=76:200, block3=201:500), max.coef = c(5,5,5),
                     block1.penalization = TRUE, lambda.type = "lambda.min", standardize = TRUE, nfolds = 5,
                     cvoffset = TRUE)

set.seed(1234)
pl2 <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                     blocks = list(block1=1:15, block2=16:200, block3=201:500),
                     block1.penalization = FALSE, lambda.type = "lambda.min", standardize = TRUE, nfolds = 5,
                     cvoffset = TRUE)

set.seed(1234)
pl2a <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                      blocks = list(block1=1:20, block2=21:200, block3=201:500),
                      max.coef = c(Inf,Inf,Inf), block1.penalization = FALSE, lambda.type = "lambda.1se", nfolds = 5,
                      cvoffset = TRUE)

set.seed(1234)
pl2b <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                      blocks = list(block1=1:20, block2=21:200, block3=201:500),
                      max.coef = c(Inf,Inf,Inf), block1.penalization = TRUE, lambda.type = "lambda.1se", nfolds = 5,
                      cvoffset = TRUE)

set.seed(1234)
pl3 <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(n=50, size=1, prob=0.5), family = "binomial",
                     type.measure = "class", blocks = list(block1=1:15, block2=16:200, block3=201:500),
                     block1.penalization = FALSE, standardize = TRUE, nfolds = 5,
                     cvoffset = TRUE)

set.seed(1234)
pl3a <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(n=50, size=1, prob=0.5), family = "binomial",
                     type.measure = "auc", blocks = list(block1=1:15, block2=16:200, block3=201:500),
                     block1.penalization = FALSE, standardize = TRUE, nfolds = 4,
                     cvoffset = TRUE)

set.seed(1234)
pl3b <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(n=50, size=1, prob=0.5), family = "binomial",
                      type.measure = "auc", blocks = list(block1=1:45, block2=46:200, block3=201:500),
                      block1.penalization = TRUE, standardize = TRUE, nfolds = 4,
                      cvoffset = TRUE)



# cox
n <- 50;p <- 300
nzc <- trunc(p/10)
set.seed(1234)
x <- matrix(rnorm(n*p), n, p)
beta <- rnorm(nzc)
fx <- x[, seq(nzc)]%*%beta/3
hx <- exp(fx)
ty <- rexp(n,hx)
tcens <- rbinom(n = n,prob = .3,size = 1)
library(survival)
y <- Surv(ty, 1-tcens)
blocks <- list(block1=1:20, block2=21:200, block3=201:300)

set.seed(1234)
pl4 <- prioritylasso(x, y, family = "cox", type.measure = "deviance", blocks = blocks,
                     block1.penalization = FALSE, lambda.type = "lambda.min", standardize = TRUE, nfolds = 5,
                     cvoffset = TRUE)


library(testthat)

context("tests for prioritylasso")

test_that("testing block1unpen", {

  expect_that(pl1$block1unpen, testthat::equals(NULL))
  expect_that(pl2$block1unpen, is_a("glm"))
  expect_that(pl3$block1unpen, is_a("glm"))
  expect_that(pl4$block1unpen, is_a("coxph"))

})


test_that("testing error messages", {

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                            blocks = list(block1=1:74, block2=76:200, block3=201:500),
                            block1.penalization = TRUE, nfolds = 5),
              throws_error("Each predictor should be included in exactly one block."))

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                            blocks = list(block1=1:75, block2=76:200, block3=201:500),
                            block1.penalization = TRUE, lambda.type = "lambda", nfolds = 5),
              throws_error("lambda.type must be either lambda.min or lambda.1se."))

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rpois(50, 3), family = "poisson", type.measure = "mse",
                            blocks = list(block1=1:75, block2=76:200, block3=201:500),
                            block1.penalization = TRUE, nfolds = 5),
              throws_error("family must be either gaussian, binomial, or cox."))

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(n=50, size=1, prob=0.5), family = "binomial",
                            type.measure = "class", blocks = list(block1=1:75, block2=76:200, block3=201:500),
                            block1.penalization = FALSE, standardize = TRUE, nfolds = 5),
              throws_error("An unpenalized block 1 is only possible if the number of predictors in this block is smaller than the number of obervations."))

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(n=50, size=1, prob=0.5), family = "binomial",
                            type.measure = "class", blocks = list(block1=1:75, block2=76:200, block3=201:500),
                            max.coef = c(5,5), block1.penalization = FALSE, standardize = TRUE,
                            nfolds = 5),
              throws_error("The length of the entries of argument max.coef must equal the number of blocks."))

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(n=50, size=1, prob=0.5), family = "binomial",
                            type.measure = "class", blocks = list(block1=1, block2=2:200, block3=201:500),
                            block1.penalization = FALSE, standardize = TRUE,
                            nfolds = 5),
              throws_error("A block has to contain at least two predictors."))

  expect_error(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(n=50, size=1, prob=0.5), family = "binomial",
                       type.measure = "auc", blocks = list(block1=1:10, block2=11:200, block3=201:500),
                       block1.penalization = FALSE, standardize = TRUE, nfolds = 5, lambda.type = "lambda.min",
                       cvoffset = TRUE))

  expect_error(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(n=50, size=1, prob=0.5), family = "binomial",
                             type.measure = "auc", blocks = list(block1=1:10, block2=11:200, block3=201:500),
                             block1.penalization = FALSE, standardize = TRUE, nfolds = 10, lambda.type = "lambda.min",
                             cvoffset = FALSE))

})



test_that("testing warning messages", {

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "auc",
                            blocks = list(block1=1:75, block2=76:200, block3=201:500),
                            block1.penalization = TRUE, nfolds = 5),
              gives_warning("type.measure is set to mse."))

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(50, 1, 0.5), family = "binomial",
                            type.measure = "deviance",
                            blocks = list(block1=1:75, block2=76:200, block3=201:500),
                            block1.penalization = TRUE, nfolds = 5),
              gives_warning("type.measure is set to class."))

  expect_that(prioritylasso(x, y, family = "cox", type.measure = "mse", blocks = blocks,
                            block1.penalization = TRUE, lambda.type = "lambda.min", standardize = TRUE, nfolds = 5),
              gives_warning("type.measure is set to partial likelihood."))

  expect_that(prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian", type.measure = "mse",
                            blocks = list(block1=1:75, block2=76:200, block3=201:500),
                            max.coef = c(10,10,8), block1.penalization = TRUE, lambda.type = "lambda.1se", nfolds = 5),
              gives_warning("lambda.1se can only be chosen without restrictions of max.coef and is set to lambda.min."))

})


test_that("testing other stuff", {

  expect_that(dim(pl1$glmnet.fit[[1]]$beta)[1] , testthat::equals(75))
  expect_that(pl1$nzero, is_a("list"))
  expect_that(pl1$name, matches("Mean-Squared Error"))
  expect_that(pl1$nzero[[1]] <= 5, is_true())
  expect_that(class(pl1a) == "prioritylasso", is_true())
  expect_that(class(pl1b) == "prioritylasso", is_true())
  expect_that(pl2a$lambda.type <= "lambda.1se", is_true())
  expect_that(pl2b$lambda.type <= "lambda.1se", is_true())
  expect_that(class(pl3a) == "prioritylasso", is_true())
  expect_that(class(pl3b) == "prioritylasso", is_true())

})
