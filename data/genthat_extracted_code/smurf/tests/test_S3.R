context("Test S3 methods")


test_that("Test coef and coef_reest", {
  
  ###################
  # Check length of coefficients
  
  expect_length(coef(munich.fit), 
                63L)
  expect_equal(length(coef(munich.fit)), 
               length(coef_reest(munich.fit)))
  
  
  ###################
  # Check if output is numeric
  
  expect_true(is.numeric(coef(munich.fit)))
  expect_true(is.numeric(coef_reest(munich.fit)))
  
  
  ###################
  # Check if correct coefficients are extracted
  
  expect_equal(coef(munich.fit),
               munich.fit$coefficients)
  expect_equal(coef_reest(munich.fit),
               munich.fit$coefficients.reest)
  
  
  ###################
  # reest = FALSE here
  
  # Check if coef_reest returns coefficients of estimated model here
  expect_equal(coef(munich.fit2), 
               suppressWarnings(coef_reest(munich.fit2)))
  
  # Check if coefficients of both estimated models are the same
  expect_equal(coef(munich.fit2), 
               coef(munich.fit))
  
  # Check if alias is correct
  expect_equal(coef(munich.fit), 
               coefficients(munich.fit))
  
  expect_equal(coef_reest(munich.fit), 
               coefficients_reest(munich.fit))
  

  # Check if warning is issued
  expect_warning(coef_reest(munich.fit2),
                 "Coefficients of the re-estimated model are not present in 'object', coefficients of the estimated model are returned.")

  # Check if warning is issued
  expect_warning(coefficients_reest(munich.fit2),
                 "Coefficients of the re-estimated model are not present in 'object', coefficients of the estimated model are returned.")
})


test_that("Test deviance and deviance_reest", {
  
  ###################
  # Check length of deviance
  
  expect_length(deviance(munich.fit), 
                1L)
  expect_equal(length(deviance(munich.fit)), 
               length(deviance_reest(munich.fit)))
  
  
  ###################
  # Check if output is numeric
  
  expect_true(is.numeric(deviance(munich.fit)))
  expect_true(is.numeric(deviance_reest(munich.fit)))
  
  
  ###################
  # Check if correct deviance is extracted
  
  expect_equal(deviance(munich.fit),
               munich.fit$deviance)
  expect_equal(deviance_reest(munich.fit),
               munich.fit$deviance.reest)
  
  
  ###################
  # reest = FALSE here
  
  # Check if deviance_reest returns deviance of estimated model here
  expect_equal(deviance(munich.fit2), 
               suppressWarnings(deviance_reest(munich.fit2)))
  
  # Check if deviance of both estimated models are the same
  expect_equal(deviance(munich.fit2), 
               deviance(munich.fit))
  
  # Check if warning is issued
  expect_warning(deviance_reest(munich.fit2),
                 "Deviance of the re-estimated model is not present in 'object', deviance of the estimated model is used.")
})


test_that("Test fitted and fitted_reest", {
  
  ###################
  # Check length of fitted
  
  expect_length(fitted(munich.fit), 
                nrow(rent))
  expect_equal(length(fitted(munich.fit)), 
               length(fitted_reest(munich.fit)))
  
  
  ###################
  # Check if output is numeric
  
  expect_true(is.numeric(fitted(munich.fit)))
  expect_true(is.numeric(fitted_reest(munich.fit)))
  
  
  ###################
  # Check if correct fitted values are extracted
  
  expect_equal(fitted(munich.fit),
               munich.fit$fitted.values)
  expect_equal(fitted_reest(munich.fit),
               munich.fit$fitted.values.reest)
  
  
  ###################
  # reest = FALSE here
  
  # Check if fitted_reest returns fitted values of estimated model here
  expect_equal(fitted(munich.fit2), 
               suppressWarnings(fitted_reest(munich.fit2)))
  
  # Check if fitted values of both estimated models are the same
  expect_equal(fitted(munich.fit2), 
               fitted(munich.fit))
  
  # Check if warning is issued
  expect_warning(fitted_reest(munich.fit2),
                 "Fitted values of the re-estimated model are not present in 'object', fitted values of the estimated model in 'object' are used.")
})


test_that("Test predict and predict_reest", {
  
  ###################
  # Check length of predictions
  
  # Save predictions
  p.link <- predict(munich.fit)
  p.link.newdata <- predict(munich.fit, newdata = rent)
  p.response <- predict(munich.fit, type = "response")
  p.response.newdata <- predict(munich.fit, type = "response", newdata = rent)
  p.terms <- predict(munich.fit, type = "terms")
  p.terms.newdata <- predict(munich.fit, newdata = rent, type = "terms")
  
  p.link.reest <- predict_reest(munich.fit)
  p.link.reest.newdata <- predict_reest(munich.fit, newdata = rent)
  p.response.reest <- predict_reest(munich.fit, type = "response")
  p.response.reest.newdata <- predict_reest(munich.fit, type = "response", newdata = rent)
  p.terms.reest <- predict_reest(munich.fit, type = "terms")
  p.terms.reest.newdata <- predict_reest(munich.fit, newdata = rent, type = "terms")
  
  
  expect_length(p.link, 
                nrow(rent))
  expect_length(p.response, 
                nrow(rent))
  expect_length(p.link.reest, 
                nrow(rent))
  expect_length(p.response.reest, 
                nrow(rent))
  

  # Check dimension of terms predictions
  expect_equal(dim(p.terms), 
               c(nrow(rent), 63L))
  expect_equal(dim(p.terms), 
               dim(p.terms.reest))
  
  
  ########################
  # Check if output is numeric
  
  expect_true(is.numeric(p.link))
  expect_true(is.numeric(p.link.newdata))
  expect_true(is.numeric(p.response))
  expect_true(is.numeric(p.response.newdata))
  expect_true(is.numeric(as.matrix(p.terms)))
  expect_true(is.numeric(as.matrix(p.terms.newdata)))
  
  expect_true(is.numeric(p.link.reest))
  expect_true(is.numeric(p.link.reest.newdata))
  expect_true(is.numeric(p.response.reest))
  expect_true(is.numeric(p.response.reest.newdata))
  expect_true(is.numeric(as.matrix(p.terms.reest)))
  expect_true(is.numeric(as.matrix(p.terms.reest.newdata)))
  
  
  ########################
  # Check if correct predictions are returned
  
  expect_equal(p.link,
               munich.fit$linear.predictors)
  expect_equal(p.response,
               munich.fit$fitted.values)
  
  expect_equal(p.link.reest,
               munich.fit$linear.predictors.reest)
  expect_equal(p.response.reest,
               munich.fit$fitted.values.reest)
  
  
  ########################
  # Check if predictions are the same when data is provided as newdata
  
  expect_equal(p.link, 
               p.link.newdata)
  expect_equal(p.response, 
               p.response.newdata)
  expect_equal(as.matrix(p.terms), 
               as.matrix(p.terms.newdata))

  expect_equal(p.link.reest, 
               p.link.reest.newdata)
  expect_equal(p.response.reest, 
               p.response.reest.newdata)
  expect_equal(as.matrix(p.terms.reest), 
               as.matrix(p.terms.reest.newdata))
  
  # With 2D effect
  expect_equal(as.matrix(predict(munich.fit3, type = "terms")), 
               as.matrix(predict(munich.fit3, type = "terms", newdata = rent)))
  
  
  ########################
  # Check if predictions are the same when data is provided as newdata and with newoffset
  
  # Random newoffset
  newoffset <- runif(nrow(rent))
  
  expect_equal(predict(munich.fit, newoffset = newoffset), 
               predict(munich.fit, newdata = rent, newoffset = newoffset))
  expect_equal(predict(munich.fit, type = "response", newoffset = newoffset), 
               predict(munich.fit, newdata = rent, type = "response", newoffset = newoffset))
  expect_equal(as.matrix(predict(munich.fit, type = "terms", newoffset = newoffset)), 
               as.matrix(predict(munich.fit, newdata = rent, type = "terms", newoffset = newoffset)))
  
  expect_equal(predict_reest(munich.fit, newoffset = newoffset), 
               predict_reest(munich.fit, newdata = rent, newoffset = newoffset))
  expect_equal(predict_reest(munich.fit, type = "response", newoffset = newoffset), 
               predict_reest(munich.fit, newdata = rent, type = "response", newoffset = newoffset))
  expect_equal(as.matrix(predict_reest(munich.fit, type = "terms", newoffset = newoffset)), 
               as.matrix(predict_reest(munich.fit, newdata = rent, type = "terms", newoffset = newoffset)))
  
  
  ###################
  # Check if predictions are the same as in object when data is provided as newdata
  
  expect_equal(p.link.newdata, 
               munich.fit$linear.predictors)
  expect_equal(p.response.newdata, 
               munich.fit$fitted.values)
  expect_equal(p.link.reest.newdata, 
               munich.fit$linear.predictors.reest)
  expect_equal(p.response.reest.newdata, 
               munich.fit$fitted.values.reest)
  
  
  ###################
  # Check if predictions are the same as in object when single row of data is provided as newdata
  
  expect_equal(predict(munich.fit, newdata = rent[23L,], type = "response"), 
               munich.fit$fitted.values[23L])
  expect_equal(predict(munich.fit, newdata = rent[23L,], type = "link"), 
               munich.fit$linear.predictors[23L])
  expect_equal(predict_reest(munich.fit, newdata = rent[23L,], type = "response"), 
               munich.fit$fitted.values.reest[23L])
  expect_equal(predict_reest(munich.fit, newdata = rent[23L,], type = "link"), 
               munich.fit$linear.predictors.reest[23L])
  
  
  ###################
  # reest = FALSE here
  
  # Check if predict_reest returns predictions of estimated model here
  expect_equal(predict(munich.fit2), 
               suppressWarnings(predict_reest(munich.fit2)))
  expect_equal(predict(munich.fit2, type = "response"), 
               suppressWarnings(predict_reest(munich.fit2, type = "response")))
  expect_equal(predict(munich.fit2, type = "terms", newdata = rent), 
               suppressWarnings(predict_reest(munich.fit2, type = "terms", newdata = rent)))
  
  # Check if predictions of both estimated models are the same
  expect_equal(predict(munich.fit2), 
               p.link)
  expect_equal(predict(munich.fit2, type = "response"), 
               p.response)
  expect_equal(as.matrix(predict(munich.fit2, type = "terms", newdata = rent)), 
               as.matrix(p.terms))
  
  # Check if warning is issued
  expect_warning(predict_reest(munich.fit2),
                 "Coefficients of the re-estimated model are not present in 'object', coefficients of the estimated model are used.")
  expect_warning(predict_reest(munich.fit2, type = "response"),
                 "Coefficients of the re-estimated model are not present in 'object', coefficients of the estimated model are used.")
  expect_warning(predict_reest(munich.fit2, type = "terms", newdata = rent),
                 "Coefficients of the re-estimated model are not present in 'object', coefficients of the estimated model are used.")
  
  # Check if error since no X matrix in output
  expect_error(predict(munich.fit2, type = "terms"),
               "Terms cannot be predicted when 'object' does not contain 'X'. 
             Please provide the data in 'newdata' or use the glmsmurf function with option 'x = TRUE'.")
})


test_that("Test residuals and residuals_reest", {
  
  ###################
  # Check length of residuals
  
  # Save residuals
  resid.dev <- residuals(munich.fit)
  resid.pea <- residuals(munich.fit, type = "pearson")
  resid.wor <- residuals(munich.fit, type = "working")
  resid.res <- residuals(munich.fit, type = "response")
  resid.par <- residuals(munich.fit, type = "partial")
  
  resid.dev.reest <- residuals_reest(munich.fit)
  resid.pea.reest <- residuals_reest(munich.fit, type = "pearson")
  resid.wor.reest <- residuals_reest(munich.fit, type = "working")
  resid.res.reest <- residuals_reest(munich.fit, type = "response")
  resid.par.reest <- residuals_reest(munich.fit, type = "partial")
  
  
  expect_length(resid.dev, 
                nrow(rent))
  expect_length(resid.pea, 
                nrow(rent))
  expect_length(resid.wor, 
                nrow(rent))
  expect_length(resid.res, 
                nrow(rent))
  expect_equal(dim(resid.par), 
               c(nrow(rent), 63L))
  
  expect_length(resid.dev.reest, 
                nrow(rent))
  expect_length(resid.pea.reest, 
                nrow(rent))
  expect_length(resid.wor.reest, 
                nrow(rent))
  expect_length(resid.res.reest, 
                nrow(rent))
  expect_equal(dim(resid.par.reest), 
               c(nrow(rent), 63L))
  
  
  ########################
  # Check if output is numeric
  
  expect_true(is.numeric(resid.dev))
  expect_true(is.numeric(resid.pea))
  expect_true(is.numeric(resid.wor))
  expect_true(is.numeric(resid.res))
  expect_true(is.numeric(as.matrix(resid.par)))
  
  expect_true(is.numeric(resid.dev.reest))
  expect_true(is.numeric(resid.pea.reest))
  expect_true(is.numeric(resid.wor.reest))
  expect_true(is.numeric(resid.res.reest))
  expect_true(is.numeric(as.matrix(resid.par.reest)))
  
  
  ########################
  # Check if correct residuals are returned
  
  expect_equal(resid.wor,
               munich.fit$residuals)

  expect_equal(resid.wor.reest,
               munich.fit$residuals.reest)

  
  ###################
  # reest = FALSE here
  
  # Check if residuals_reest returns residuals of estimated model here
  expect_equal(residuals(munich.fit2), 
               suppressWarnings(residuals_reest(munich.fit2)))
  expect_equal(residuals(munich.fit2, type = "pearson"), 
               suppressWarnings(residuals_reest(munich.fit2, type = "pearson")))
  expect_equal(residuals(munich.fit2, type = "working"), 
               suppressWarnings(residuals_reest(munich.fit2, type = "working")))
  expect_equal(residuals(munich.fit2, type = "response"), 
               suppressWarnings(residuals_reest(munich.fit2, type = "response")))

  
  # Check if predictions of both estimated models are the same
  expect_equal(residuals(munich.fit2), 
               resid.dev)
  expect_equal(residuals(munich.fit2, type = "pearson"), 
               resid.pea)
  expect_equal(residuals(munich.fit2, type = "working"), 
               resid.wor)
  expect_equal(residuals(munich.fit2, type = "response"), 
               resid.res)

  # Check if warning is issued
  expect_warning(residuals_reest(munich.fit2),
                 "Residuals of the re-estimated model are not present in 'object', residuals of the estimated model in 'object' are used.")
  expect_warning(residuals_reest(munich.fit2, type = "pearson"),
                 "Residuals of the re-estimated model are not present in 'object', residuals of the estimated model in 'object' are used.")
  expect_warning(residuals_reest(munich.fit2, type = "working"),
                 "Residuals of the re-estimated model are not present in 'object', residuals of the estimated model in 'object' are used.")
  expect_warning(residuals_reest(munich.fit2, type = "response"),
                 "Residuals of the re-estimated model are not present in 'object', residuals of the estimated model in 'object' are used.")

  # Check if error since no X matrix in output
  expect_error(residuals(munich.fit2, type = "partial"))
  
  
  # Check if alias is correct
  expect_equal(residuals(munich.fit), 
               resid(munich.fit))
  
  expect_equal(residuals_reest(munich.fit), 
               resid_reest(munich.fit))
  
  
  # Check without y
  munich.fit.noy <- munich.fit
  munich.fit.noy$y <- NULL
  
  expect_equal(residuals(munich.fit.noy, type = "deviance"), 
               resid.dev)
  expect_equal(residuals(munich.fit.noy, type = "partial"), 
               resid.par)
  
  expect_equal(residuals_reest(munich.fit.noy, type = "deviance"), 
               resid.dev.reest)
  expect_equal(residuals_reest(munich.fit.noy, type = "partial"), 
               resid.par.reest)
  
  
  # Check with df.residual = 0
  munich.fit.noy$df.residual <- 0
  
  expect_equal(as.numeric(residuals(munich.fit.noy, type = "deviance")), 
               rep(0, length(fitted(munich.fit.noy))))
  expect_equal(as.numeric(residuals_reest(munich.fit.noy, type = "deviance")), 
               rep(0, length(fitted_reest(munich.fit.noy))))
})


test_that("plot", {
  
  # Check if no error
  expect_error(plot(munich.fit), NA)
  expect_error(plot_reest(munich.fit), NA)
  expect_error(plot(munich.fit2), NA)
  expect_error(plot(munich.fit, basic = TRUE), NA)
  expect_error(plot_reest(munich.fit, basic = TRUE), NA)
  expect_error(plot(munich.fit2, basic = TRUE), NA)
  
  # Check if warning since no re-estimated coefficients
  expect_warning(plot_reest(munich.fit2), 
                 "Coefficients of the re-estimated model are not present in 'x', the coefficients of the estimated model are plotted.")
})


test_that("plot_lambda", {
  
  # Expect warning since user-specified value of lambda
  expect_warning(plot_lambda(munich.fit), 
                 "Validation scores are not available since a user-specified value of lambda was used.")
  
  # BIC and GCV versions
  munich.fit.is.bic <- munich.fit.is.gcv <- munich.fit.is
  munich.fit.is.bic$lambda.method <- "is.bic"
  munich.fit.is.gcv$lambda.method <- "is.gcv"
  
  # MSE and DSS versions
  munich.fit.oos.mse <- munich.fit.oos.dss <- munich.fit.oos
  munich.fit.oos.mse$lambda.method <- "oos.mse"
  munich.fit.oos.dss$lambda.method <- "oos.dss"
  
  # deviance and DSS versions
  munich.fit.cv.dev <- munich.fit.cv.dss <- munich.fit.cv
  munich.fit.cv.dev$lambda.method <- "cv.dev"
  munich.fit.cv.dss$lambda.method <- "cv.dss"
  
  # deviance and DSS versions
  munich.fit.cv1se.dev <- munich.fit.cv1se.dss <- munich.fit.cv1se
  munich.fit.cv1se.dev$lambda.method <- "cv.dev"
  munich.fit.cv1se.dss$lambda.method <- "cv.dss"
  
  
  # Check if no error
  expect_error(plot_lambda(munich.fit.is), NA)
  expect_error(plot_lambda(munich.fit.is.bic), NA)
  expect_error(plot_lambda(munich.fit.is.gcv), NA)
  expect_error(plot_lambda(munich.fit.oos), NA)
  expect_error(plot_lambda(munich.fit.oos.mse), NA)
  expect_error(plot_lambda(munich.fit.oos.dss), NA)
  expect_error(plot_lambda(munich.fit.cv), NA)
  expect_error(plot_lambda(munich.fit.cv.dev), NA)
  expect_error(plot_lambda(munich.fit.cv.dss), NA)
  expect_error(plot_lambda(munich.fit.cv1se), NA)
  expect_error(plot_lambda(munich.fit.cv1se.dev), NA)
  expect_error(plot_lambda(munich.fit.cv1se.dss), NA)
  
  expect_error(plot_lambda(munich.fit.is, log.lambda = FALSE), NA)
  expect_error(plot_lambda(munich.fit.oos, log.lambda = FALSE), NA)
  expect_error(plot_lambda(munich.fit.cv, log.lambda = FALSE), NA)
  expect_error(plot_lambda(munich.fit.cv1se, log.lambda = FALSE), NA)
  
  expect_error(plot_lambda(munich.fit.is, lambda.opt = FALSE), NA)
  expect_error(plot_lambda(munich.fit.oos, lambda.opt = FALSE), NA)
  expect_error(plot_lambda(munich.fit.cv, lambda.opt = FALSE), NA)
  expect_error(plot_lambda(munich.fit.cv1se, lambda.opt = FALSE), NA)
  
  expect_error(plot_lambda(munich.fit.cv1se, cv1se = FALSE), NA)
  
  # Check if error for invalid method to select lambda
  munich.fit.is2 <- munich.fit.is
  munich.fit.is$lambda.method <- "is.mse"
  expect_error(plot_lambda(munich.fit.is), "Invalid method to select lambda.")
})


test_that("summary", {
  
  # Check if no error, use invisible and capture.output to not print summary
  expect_error(invisible(capture.output(summary(munich.fit))), NA)
  expect_error(invisible(capture.output(summary(munich.fit2))), NA)
})
