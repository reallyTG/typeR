library(COMPoissonReg)


### Name: COMPoissonReg-package
### Title: Estimate parameters for COM-Poisson regression
### Aliases: COM-PoissonReg-package COM-PoissonReg COMPoissonReg

### ** Examples

  ## load freight data
  data(freight)

  # Fit standard Poisson model
  glm.out <- glm(broken ~ transfers, data=freight,
    family=poisson, na.action=na.exclude)
  print(glm.out)

  # Fit COM-Poisson model (with intercept-only regression linked to the
  # dispersion parameter)
  cmp.out <- glm.cmp(broken ~ transfers, data=freight)
  print(cmp.out)
  coef(cmp.out)
  nu(cmp.out)[1]

  # Compute associated standard errors
  sdev(cmp.out)

  # Get the full covariance matrix for the estimates
  vcov(cmp.out)

  # Likelihood ratio test for dispersion parameter
  # Test for H_0: dispersion equal to 1 vs. H_1: not equal to 1
  # (i.e. Poisson vs. COM-Poisson regression models)
  lrt <- equitest(cmp.out)

  # Compute constant COM-Poisson leverage
  lev <- leverage(cmp.out)

  ## No test: 
  # Compute constant COM-Poisson deviances
  dev <- deviance(cmp.out)
  
## End(No test)

  # Compute fitted values
  y.hat <- predict(cmp.out, newdata=freight)

  # Compute residual values
  res <- residuals(cmp.out)
  print(summary(res))

  # Compute MSE
  mean(res^2)

  # Compute predictions on new data
  new_data <- data.frame(transfers=(0:10))
  y.hat <- predict(cmp.out, newdata=new_data)
  plot(0:10, y.hat, type="l",
    xlab="number of transfers", ylab="predicted number broken")

  ## No test: 
  # Compute parametric bootstrap results and use them to generate
  # 0.95 confidence intervals for parameters.
  cmp.boot <- parametric_bootstrap(cmp.out, reps=1000)
  print(apply(cmp.boot, 2, quantile, c(0.025,0.975)))
  
## End(No test)

  ## No test: 
  ## load couple data
  data(couple)

  # Fit standard Poisson model
  glm.out <- glm(UPB ~ EDUCATION + ANXIETY, data=couple, family=poisson)
  print(glm.out)

  # Fit ZICMP model
  zicmp.out <- glm.cmp(UPB ~ EDUCATION + ANXIETY,
    formula.nu = ~ 1,
    formula.p = ~ EDUCATION + ANXIETY,
    data=couple)
  print(zicmp.out)

  # Compute standard errors for estimates of coefficients
  sdev(zicmp.out)

  # Get the full covariance matrix for the estimates
  vcov(zicmp.out)

  # Likelihood ratio test for equidispersion (H0: nu = 1 vs H1: not)
  equitest(zicmp.out)

  # Compute fitted values
  y.hat <- predict(zicmp.out)

  # Compute residuals
  res.raw <- residuals(zicmp.out, type = "raw")
  res.quan <- residuals(zicmp.out, type = "quantile")
  print(summary(res.raw))
  print(summary(res.quan))

  # Compute predictions on new data
  new_data <- data.frame(EDUCATION = round(1:20 / 20), ANXIETY = seq(-3,3, length.out = 20))
  y.hat.new <- predict(zicmp.out, newdata=new_data)
  print(y.hat.new)
  
  # Compute parametric bootstrap results and use them to generate
  # 0.95 confidence intervals for parameters.
  zicmp.boot <- parametric_bootstrap(zicmp.out, reps=1000)
  print(apply(zicmp.boot, 2, quantile, c(0.025,0.975)))
  
## End(No test)



