context("Test output from glmsmurf function")

test_that("Test output class", {

  # Check if class of output object is "glmsmurf"
  expect_equal(class(munich.fit)[1], 
               "glmsmurf")
  # Check if class of output object inherits from list, glm and lm classes
  expect_is(munich.fit, 
            "list")
  expect_is(munich.fit, 
            "glm")
  expect_is(munich.fit, 
            "lm")
})


test_that("Test coefficients in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$coefficients))
  
  # Check length
  expect_length(munich.fit$coefficients, 
                63L)
})


test_that("Test residuals in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$residuals))
  
  # Check length
  expect_length(munich.fit$residuals, 
                nrow(rent))
})


test_that("Test fitted values in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$fitted.values))
  
  # Check length
  expect_length(munich.fit$fitted.values, 
                nrow(rent))
})


test_that("Test rank in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$rank))
  
  # Check length
  expect_length(munich.fit$rank, 
                1L)
    
  # Check if strictly positive
  expect_true(munich.fit$rank > 0)
  
  # Check if integer
  expect_true(.is.wholenumber(munich.fit$rank))
})


test_that("Test family in output", {
  
  # Check class
  expect_true(class(munich.fit$family) == "family")
})


test_that("Test linear predictors in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$linear.predictors))
  
  # Check length
  expect_length(munich.fit$linear.predictors, 
                nrow(rent))
  
  # Check if can be transformed to fitted values using link function
  expect_equal(munich.fit$family$linkfun(munich.fit$linear.predictors), 
               munich.fit$fitted.values)
})


test_that("Test deviance in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$deviance))
  
  # Check length
  expect_length(munich.fit$deviance, 
                1L)
})


test_that("Test AIC in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$aic))
  
  # Check length
  expect_length(munich.fit$aic, 
                1L)
})


test_that("Test BIC in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$bic))
  
  # Check length
  expect_length(munich.fit$bic, 
                1L)
  
  # Check if BIC can be obtained from AIC
  expect_equal(munich.fit$aic  + (log(sum(munich.fit$weights != 0)) - 2) * munich.fit$rank, 
               munich.fit$bic)
})


test_that("Test GCV in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$gcv))
  
  # Check length
  expect_length(munich.fit$gcv, 
                1L)
  
  # Check if GCV can be obtained from deviance
  n2 <- sum(munich.fit$weights != 0)
  expect_equal(munich.fit$deviance  / (n2 * (1 - munich.fit$rank / n2) ^ 2), 
               munich.fit$gcv)
})


test_that("Test null deviance in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$null.deviance))
  
  # Check length
  expect_length(munich.fit$null.deviance, 
                1L)
})


test_that("Test residual DoF in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$df.residual))
  
  # Check length
  expect_length(munich.fit$df.residual, 
                1L)
  
  # Check if can be obtained using weights and rank
  expect_equal(sum(munich.fit$weights != 0) - munich.fit$rank, 
               munich.fit$df.residual)
})


test_that("Test null DoF in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$df.null))
  
  # Check length
  expect_length(munich.fit$df.null, 
                1L)
  
  # Check if can be obtained using weights and rank of null model (1)
  expect_equal(sum(munich.fit$weights != 0) - 1, 
               munich.fit$df.null)
})


test_that("Test objective function in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$obj.fun))
  
  # Check length
  expect_length(munich.fit$obj.fun, 
                1L)
})


test_that("Test weights in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$weights))
  
  # Check length
  expect_length(munich.fit$weights, 
                nrow(rent))
  
  # Check if positive
  expect_true(all(munich.fit$weights >= 0))
})


test_that("Test offset in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$offset))
  
  # Check length
  expect_length(munich.fit$offset, 
                nrow(rent))
})


test_that("Test lambda in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$lambda))
  
  # Check length
  expect_length(munich.fit$lambda, 
                1L)
  
  # Check if positive
  expect_true(munich.fit$lambda >= 0)
})


test_that("Test lambda1 in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$lambda1))
  
  # Check length
  expect_length(munich.fit$lambda1, 
                1L)
  
  # Check if positive
  expect_true(munich.fit$lambda1 >= 0)
})


test_that("Test lambda2 in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$lambda2))
  
  # Check length
  expect_length(munich.fit$lambda2, 
                1L)
  
  # Check if positive
  expect_true(munich.fit$lambda2 >= 0)
})


test_that("Test iter in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$iter))
  
  # Check length
  expect_length(munich.fit$iter, 
                1L)
  
  # Check if strictly positive
  expect_true(munich.fit$iter > 0)
  
  # Check if integer
  expect_true(.is.wholenumber(munich.fit$iter))
})


test_that("Test converged in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$converged))
  
  # Check length
  expect_length(munich.fit$converged, 
                1L)
  
  # Check if 0, 1, 2 or 3
  expect_true(munich.fit$converged %in% 0:3)
})


test_that("Test final stepsize in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$final.stepsize))
  
  # Check length
  expect_length(munich.fit$final.stepsize, 
                1L)
  
  # Check if larger than minimum stepsize
  expect_true(munich.fit$final.stepsize >= 1e-14)
})


test_that("Test n.par.cov in output", {
  
  # Check if list
  expect_true(is.list(munich.fit$n.par.cov))
  
  # Check length
  expect_length(munich.fit$n.par.cov, 
                11L)
  
  # Check if all numeric
  expect_true(all(sapply(munich.fit$n.par.cov, is.numeric)))
  
  # Check lengths
  expect_true(all(sapply(munich.fit$n.par.cov, length) == 1L))
  
  # Check if all strictly positive
  expect_true(all(unlist(munich.fit$n.par.cov, length) > 0))
  
  # Check if all integers
  expect_true(all(sapply(munich.fit$n.par.cov, .is.wholenumber)))
})


test_that("Test pen.cov in output", {
  
  # Check if list
  expect_true(is.list(munich.fit$pen.cov))
  
  # Check length
  expect_length(munich.fit$pen.cov, 
                11L)
  
  # Check if all character
  expect_true(all(sapply(munich.fit$pen.cov, is.character)))
  
  # Check lengths
  expect_true(all(sapply(munich.fit$pen.cov, length) == 1L))
  
  # Check if all correct penalty types
  expect_true(all(sapply(munich.fit$pen.cov, function(x) x %in% c("none", "lasso", "grouplasso", 
                                                                  "flasso", "gflasso", "2dflasso", "ggflasso"))))
})


test_that("Test group.cov in output", {
  
  # Check if list
  expect_true(is.list(munich.fit$group.cov))
  
  # Check length
  expect_length(munich.fit$group.cov, 
                11L)
  
  # Check lengths
  expect_true(all(sapply(munich.fit$group.cov, length) == 1L))
  
  # Check if all numeric
  expect_true(all(sapply(munich.fit$group.cov, is.numeric)))
  
  # Check if all positive
  expect_true(all(unlist(munich.fit$group.cov) >= 0))
  
  # Check if all integers
  expect_true(all(sapply(munich.fit$group.cov, .is.wholenumber)))
})


test_that("Test refcat.cov in output", {
  
  # Check if list
  expect_true(is.list(munich.fit$refcat.cov))
  
  # Check length
  expect_length(munich.fit$refcat.cov, 
                11L)
  
  # Check lengths
  expect_true(all(sapply(munich.fit$refcat.cov, length) == 1L))
  
  # Check if all numeric
  expect_true(all(sapply(munich.fit$refcat.cov, is.numeric)))
  
  # Check if all positive
  expect_true(all(unlist(munich.fit$refcat.cov) >= 0))
  
  # Check if all integers
  expect_true(all(sapply(munich.fit$refcat.cov, .is.wholenumber)))
})


test_that("Test control in output", {
  
  # Check if list
  expect_true(is.list(munich.fit$control))
  
  # Check length
  expect_length(munich.fit$control,
                16L)
  
  # Check if no error
  expect_error(do.call("glmsmurf.control", munich.fit$control), NA)
})


test_that("Test lambda.method in output", {
  
  # Check if character
  expect_true(is.character(munich.fit.is$lambda.method))
  expect_true(is.character(munich.fit.oos$lambda.method))
  expect_true(is.character(munich.fit.cv$lambda.method))
  expect_true(is.character(munich.fit.cv1se$lambda.method))
  
  # Check name
  expect_equal(munich.fit.is$lambda.method, "is.aic")
  expect_equal(munich.fit.oos$lambda.method, "oos.dev")
  expect_equal(munich.fit.cv$lambda.method, "cv.mse")
  expect_equal(munich.fit.cv1se$lambda.method, "cv1se.mse")
})


test_that("Test lambda.vector in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit.is$lambda.vector))
  expect_true(is.numeric(munich.fit.oos$lambda.vector))
  expect_true(is.numeric(munich.fit.cv$lambda.vector))
  expect_true(is.numeric(munich.fit.cv1se$lambda.vector))
  
  # Check length
  expect_length(munich.fit.is$lambda.vector,
                3L)
  expect_length(munich.fit.oos$lambda.vector,
                3L)
  expect_length(munich.fit.cv$lambda.vector,
                3L)
  expect_length(munich.fit.cv1se$lambda.vector,
                3L)
})


test_that("Test lambda.measures in output", {
  
  # Check if list
  expect_true(is.list(munich.fit.is$lambda.measures))
  expect_true(is.list(munich.fit.oos$lambda.measures))
  expect_true(is.list(munich.fit.cv$lambda.measures))
  expect_true(is.list(munich.fit.cv1se$lambda.measures))
  
  # Check length
  expect_length(munich.fit.is$lambda.measures,
                3L)
  expect_length(munich.fit.oos$lambda.measures,
                3L)
  expect_length(munich.fit.cv$lambda.measures,
                3L)
  expect_length(munich.fit.cv1se$lambda.measures,
                3L)
  
  # Check names
  expect_equal(names(munich.fit.is$lambda.measures),
               c("aic", "bic", "gcv"))
  expect_equal(names(munich.fit.oos$lambda.measures),
               c("dev", "mse", "dss"))
  expect_equal(names(munich.fit.cv$lambda.measures),
               c("dev", "mse", "dss"))
  expect_equal(names(munich.fit.cv1se$lambda.measures),
               c("dev", "mse", "dss"))
  
  # Check dimensions
  expect_equal(as.numeric(sapply(munich.fit.is$lambda.measures, dim)),
               rep(c(3, 1), 3L))
  expect_equal(as.numeric(sapply(munich.fit.oos$lambda.measures, dim)),
               rep(c(3, 1), 3L))
  expect_equal(as.numeric(sapply(munich.fit.cv$lambda.measures, dim)),
               rep(c(3, 2), 3L))
  expect_equal(as.numeric(sapply(munich.fit.cv1se$lambda.measures, dim)),
               rep(c(3, 2), 3L))
  
  # Check column names
  expect_equal(as.character(sapply(munich.fit.is$lambda.measures, colnames)),
               rep("In-sample", 3L))
  expect_equal(as.character(sapply(munich.fit.oos$lambda.measures, colnames)),
               rep("Out-of-sample", 3L))
  expect_equal(as.character(sapply(munich.fit.cv$lambda.measures, colnames)),
               rep(paste("Fold", 1:2), 3L))
  expect_equal(as.character(sapply(munich.fit.cv1se$lambda.measures, colnames)),
               rep(paste("Fold", 1:2), 3L))
  
  # Check row names
  expect_equal(as.numeric(sapply(munich.fit.is$lambda.measures, rownames)),
               rep(round(munich.fit.is$lambda.vector, 4), 3L))
  expect_equal(as.numeric(sapply(munich.fit.oos$lambda.measures, rownames)),
               rep(round(munich.fit.oos$lambda.vector, 4), 3L))
  expect_equal(as.numeric(sapply(munich.fit.cv$lambda.measures, rownames)),
               rep(round(munich.fit.cv$lambda.vector, 4), 3L))
  expect_equal(as.numeric(sapply(munich.fit.cv1se$lambda.measures, rownames)),
               rep(round(munich.fit.cv1se$lambda.vector, 4), 3L))
})


test_that("Test lambda.coefficients in output", {
  
  # Check if matrix
  expect_true(is.matrix(munich.fit.is$lambda.coefficients))
  expect_true(is.matrix(munich.fit.oos$lambda.coefficients))
  # Check if NULL
  expect_true(is.null(munich.fit.cv$lambda.coefficients))
  expect_true(is.null(munich.fit.cv1se$lambda.coefficients))
  
  # Check dimensions
  expect_equal(dim(munich.fit.is$lambda.coefficients),
               c(length(munich.fit.is$lambda.vector), length(coef(munich.fit.is))))
  expect_equal(dim(munich.fit.oos$lambda.coefficients),
               c(length(munich.fit.oos$lambda.vector), length(coef(munich.fit.is))))

  # Check column names
  expect_equal(colnames(munich.fit.is$lambda.coefficients), 
               names(coef(munich.fit.is)))
  expect_equal(colnames(munich.fit.oos$lambda.coefficients),
               names(coef(munich.fit.oos)))

  # Check row names
  expect_equal(as.numeric(sapply(munich.fit.is$lambda.measures, rownames)),
               rep(round(munich.fit.is$lambda.vector, 4), 3L))
  expect_equal(as.numeric(sapply(munich.fit.oos$lambda.measures, rownames)),
               rep(round(munich.fit.oos$lambda.vector, 4), 3L))
})


test_that("Test X in output", {
  
  # Check if matrix
  expect_true((class(munich.fit$X) %in% c("Matrix", "dgeMatrix", "dgCMatrix")) |
              (is.matrix(munich.fit$X) & is.numeric(munich.fit$X)))
  
  # Check dimension
  expect_equal(dim(munich.fit$X),
               c(nrow(rent), 63L))
  
  # Check if null (not present)
  expect_null(munich.fit2$X)
})




test_that("Test re-estimated coefficients in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$coefficients.reest))
  
  # Check length
  expect_length(munich.fit$coefficients.reest, 
                length(munich.fit$coefficients))
  
  # Check if NULL (not present)
  expect_null(munich.fit2$coefficients.reest)
})


test_that("Test re-estimated residuals in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$residuals.reest))
  
  # Check length
  expect_length(munich.fit$residuals.reest, 
                length(munich.fit$residuals))
  
  # Check if NULL (not present)
  expect_null(munich.fit2$residuals.reest)
})


test_that("Test re-estimated fitted values in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$fitted.values.reest))
  
  # Check length
  expect_length(munich.fit$fitted.values.reest, 
                length(munich.fit$fitted.values))
  
  # Check if NULL (not present)
  expect_null(munich.fit2$fitted.values.reest)
})


test_that("Test re-estimated rank in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$rank.reest))
  
  # Check length
  expect_length(munich.fit$rank.reest, 
                1L)
  
  # Check if strictly positive
  expect_true(munich.fit$rank.reest > 0)
  
  # Check if integer
  expect_true(.is.wholenumber(munich.fit$rank.reest))
  
  # Check if NULL (not present)
  expect_null(munich.fit2$rank.reest)
})


test_that("Test re-estimated linear predictors in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$linear.predictors.reest))
  
  # Check length
  expect_length(munich.fit$linear.predictors.reest, 
                length(munich.fit$linear.predictors))
  
  # Check if can be transformed to fitted values using link function
  expect_equal(munich.fit$family$linkfun(munich.fit$linear.predictors.reest), 
               munich.fit$fitted.values.reest)
  
  # Check if NULL (not present)
  expect_null(munich.fit2$linear.predictors.reest)
})


test_that("Test re-estimated deviance in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$deviance.reest))
  
  # Check length
  expect_length(munich.fit$deviance.reest, 
                1L)
  
  # Check if NULL (not present)
  expect_null(munich.fit2$deviance.reest)
})


test_that("Test re-estimated AIC in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$aic.reest))
  
  # Check length
  expect_length(munich.fit$aic.reest, 
                1L)
  
  # Check if NULL (not present)
  expect_null(munich.fit2$aic.reest)
})


test_that("Test re-estimated BIC in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$bic.reest))
  
  # Check length
  expect_length(munich.fit$bic.reest, 
                1L)
  
  # Check if BIC can be obtained from AIC
  expect_equal(munich.fit$aic.reest  + (log(sum(munich.fit$weights != 0)) - 2) * munich.fit$rank.reest, 
               munich.fit$bic.reest)
  
  # Check if NULL (not present)
  expect_null(munich.fit2$bic.reest)
})


test_that("Test re-estimated GCV in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$gcv.reest))
  
  # Check length
  expect_length(munich.fit$gcv, 
                1L)
  
  # Check if GCV can be obtained from deviance
  n2 <- sum(munich.fit$weights != 0)
  expect_equal(munich.fit$deviance.reest  / (n2 * (1 - munich.fit$rank.reest / n2) ^ 2), 
               munich.fit$gcv.reest)
  
  # Check if NULL (not present)
  expect_null(munich.fit2$gcv.reest)
})


test_that("Test re-estimated residual DoF in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$df.residual.reest))
  
  # Check length
  expect_length(munich.fit$df.residual.reest, 
                1L)
  
  # Check if can be obtained using weights and rank
  expect_equal(sum(munich.fit$weights != 0) - munich.fit$rank.reest, 
               munich.fit$df.residual.reest)
  
  # Check if NULL (not present)
  expect_null(munich.fit2$df.residual.reest)
})


test_that("Test re-estimated objective function in output", {
  
  # Check if numeric
  expect_true(is.numeric(munich.fit$obj.fun.reest))
  
  # Check length
  expect_length(munich.fit$obj.fun.reest, 
                1L)
  
  # Check if NULL (not present)
  expect_null(munich.fit2$obj.fun.reest)
})


test_that("Test X.reest in output", {
  
  # Check if matrix
  expect_true((class(munich.fit$X.reest) %in% c("Matrix", "dgeMatrix", "dgCMatrix")) |
                (is.matrix(munich.fit$X.reest) & is.numeric(munich.fit$X.reest)))
  
  # Check dimension
  expect_equal(dim(munich.fit$X.reest),
               c(nrow(rent), munich.fit$rank.reest))
  
  # Check if null (not present)
  expect_null(munich.fit2$X.reest)
})



test_that("Test call in output", {
  
  # Check class
  expect_true(is.call(munich.fit$call))
})


test_that("Test formula in output", {
  
  # Check class
  expect_true(class(munich.fit$formula) == "formula")
})


test_that("Test terms in output", {
  
  # Check class
  expect_true(class(munich.fit$terms)[1] == "terms")
})


test_that("Test contrasts in output", {
  
  # Check class
  expect_true(is.list(munich.fit$contrasts))
  
  # Check length
  expect_length(munich.fit$contrasts,
                5L)
})


test_that("Test xlevels in output", {
  
  # Check class
  expect_true(is.list(munich.fit$xlevels))
  
  # Check length
  expect_length(munich.fit$xlevels,
                10L)
})