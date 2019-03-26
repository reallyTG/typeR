## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE, include=FALSE------------------------------------------
library(corpcor)
library(VGAM)
library(mvtnorm)

## ---- echo = FALSE-------------------------------------------------------
GenUniGpois = function(theta, lambda, n, details = TRUE, method){
  # Check if parameters are valid
  tol = .Machine$double.eps^0.5
  if (n <= 0 | abs(n - round(n)) > tol) {
    stop("n must be a positive integer.")
  }
  if(n == 1) stop("Parameter estimates are exactly the same as input of parameters in the case when n = 1!")
  if(theta <= 0) stop("Theta has to be greater than 0!")
  if(lambda >= 1) stop("Lambda has to be less than 1!")
  if (lambda < 0 & lambda < (-theta) / 4) stop(paste("For lambda < 0, lambda must be >= -theta/4 = ", (-theta)/4, "!", sep = ""))
  myset = numeric(n)
  if (lambda == 0) { # 1. rpois function
    myset = rpois(n,theta)
    if (n != 1) {
      model = vglm(myset ~ 1, family = genpoisson(zero = 1))
      coef = Coef(model, matrix = TRUE)
      emp.theta = round(coef['theta'], 6)
      emp.lambda = round(coef['lambda'], 6)
    }
  } else if (method == "Inversion"){ # 2. Inversion Method (when lambda is negative)
    w = exp(-lambda)
    for (i in 1:n){
      mys = exp(-theta)
      myp = mys
      x = 0
      u = runif(1)
      while (u > mys){
        x = x + 1
        myc = theta - lambda + lambda*x
        myp = w * myc * (1 + lambda/myc)^(x-1) * myp * x^(-1)
        mys = mys + myp
      }
      myset[i] = x
    }
    if (n != 1) {
      model = vglm(myset ~ 1, family = genpoisson(zero = 1))
      coef = Coef(model, matrix = TRUE)
      emp.theta = round(coef['theta'], 6)
      emp.lambda = round(coef['lambda'], 6)
    }
  } else if (method == "Branching") { # 3. Branching Method (when lambda is positive)
    if (lambda < 0) stop("Lambda should be greater than 0!")
    for (i in 1:n){
      index = 0
      y = rpois(1,theta)
      x = y
      if (y <= 0) myset[i] = x
      else while(index == 0){
        z = rpois(1, lambda * y)
        x = x + z
        y = z
        index = 1 * (y <= 0)
      }
      myset[i] = x
    }
    if (n != 1) {
      model = vglm(myset ~ 1, family = genpoisson(zero = 1))
      coef = Coef(model, matrix = TRUE)
      emp.theta = round(coef['theta'], 6)
      emp.lambda = round(coef['lambda'], 6)
    }
  } else if (method == "Normal-Approximation") { # 4. Normal-Approximation Method (when theta is large enough which is bigger than 10)
    if (theta < 10) warning("Normal approximation may not be reliable for theta less than 10!")
    mym = theta / (1 - lambda)
    myv = sqrt(theta * (1 - lambda)^(-3))
    y = rnorm(n)
    x = floor(mym + myv * y + 0.5)
    x[x < 0] = 0
    myset = x
    if (n != 1) {
      model = vglm(myset ~ 1, family = genpoisson(zero = 1))
      coef = Coef(model, matrix = TRUE)
      emp.theta = round(coef['theta'], 6)
      emp.lambda = round(coef['lambda'], 6)
    }
  } else if (method == "Build-Up") { # 5. Build-Up Method
    mynumx = numeric(n)
    t = exp(-theta)
    for (i in 1:n) {
      u = runif(1)
      x = 0
      px = t
      s = px
      while (u > s) {
        x = x + 1
        px = theta * (theta + lambda * x)^(x - 1)*exp(-theta - lambda * x) / factorial(x)
        s = s + px
      }
      myset[i] = x
    }
    if (n != 1) {
      model = vglm(myset ~ 1, family = genpoisson(zero = 1))
      coef = Coef(model, matrix = TRUE)
      emp.theta = round(coef['theta'], 6)
      emp.lambda = round(coef['lambda'], 6)
    }
  } else if (method == "Chop-Down") { # 6. Chop-Down Method
    mynump = numeric(n)
    t = exp(-theta)
    for (i in 1:n) {
      u = runif(1)
      x = 0
      px = t
      while (u > px) {
        u = u - px
        x = x + 1
        px = theta * (theta + lambda * x)^(x - 1) * exp(-theta - lambda * x) / factorial(x)
      }
      myset[i] = x
    }
    if (n != 1) {
      model = vglm(myset ~ 1, family = genpoisson(zero = 1))
      coef = Coef(model, matrix = TRUE)
      emp.theta = round(coef['theta'], 6)
      emp.lambda = round(coef['lambda'], 6)
    }
  }
  if (details == TRUE) {
    print(paste("Specified theta is ", theta, ", empirical theta is ",
                 emp.theta, ", specified lambda is ", lambda, ", empirical lambda is ", emp.lambda, ".", sep = ""))
  }
   return(invisible(list(data = myset,
                         specified.theta = theta,
                         empirical.theta = as.numeric(emp.theta),
                         specified.lambda = lambda,
                         empirical.lambda = as.numeric(emp.lambda))))
}

## ------------------------------------------------------------------------
GenUniGpois(2, 0.9, 100, method = "Branching")
GenUniGpois(5, -0.4, 100, method = "Inversion")
GenUniGpois(12, 0.5, 100, method = "Normal-Approximation")
data = GenUniGpois(10, 0.4, 10, method = "Chop-Down", details = FALSE)
data = GenUniGpois(3, 0.9, 10000, method = "Build-Up", details = FALSE)

## ---- echo = FALSE, warning=FALSE----------------------------------------
ComputeCorrGpois = function(theta.vec, lambda.vec) {
  no.gpois = length(theta.vec)
  samples = 1e+05
  u = matrix(NA, nrow = no.gpois, ncol = samples)
  for (i in 1:no.gpois){
    u[i,] = GenUniGpois(theta.vec[i], lambda.vec[i], samples, method = "Inversion", details = FALSE)$data
  }
  maxmat = minmat = diag(NA, no.gpois)
  errorCount = 0
  for (i in 1:no.gpois){
    for (j in 1:no.gpois){
      if (i != j) {
        maxcor = cor(sort(u[i,]), sort(u[j,]))
        mincor = cor(sort(u[i,]), sort(u[j,], decreasing = TRUE))
        minmat[i, j] = mincor
        maxmat[i, j] = maxcor
        cat(".")
      }
    }
  }
  cat("\n")
  return(list(min = minmat, max = maxmat))
}

## ------------------------------------------------------------------------
ComputeCorrGpois(c(3,2,5,4),c(0.3,0.2,0.5,0.6))
ComputeCorrGpois(c(4,5),c(-0.45,-0.11))

## ---- echo = FALSE-------------------------------------------------------
ValidCorrGpois = function (corMat, theta.vec, lambda.vec) {
  no.gpois = length(theta.vec)
  errorCount = 0
  if (ncol(corMat) != (no.gpois)) {
    stop("Dimension of correlation matrix does not match the number of variables!\n")
  }
  if (is.positive.definite(corMat) == FALSE) {
    stop("Specified correlation matrix is not positive definite! \n")
  }
  if (isSymmetric(corMat) == FALSE) {
    stop("Specified correlation matrix is not symmetric! \n")
  }
  if (sum(corMat > 1) > 0) {
    stop("Correlation values cannot be greater than 1! \n")
  }
  if (sum(corMat < (-1)) > 0) {
    stop("Correlation values cannot be less than -1! \n")
  }
  if (sum(diag(corMat) != 1) > 0) {
    stop("All diagonal elements of the correlation matrix must be 1! \n")
  }
  maxcor = ComputeCorrGpois(theta.vec, lambda.vec)$max
  mincor = ComputeCorrGpois(theta.vec, lambda.vec)$min
  for (i in 1:nrow(corMat)) {
    for (j in 1:i) {
      if (errorCount == 0)
        cat(".")
      if (i != j) {
        if (corMat[i, j] > maxcor[i, j] | corMat[i, j] <  mincor[i, j]) {
          cat("\n corMat[", i, ",", j, "] must be between ", round(mincor[i,j], 3), " and ", round(maxcor[i,j], 3), "\n")
          errorCount = errorCount + 1
        }
      }
    }
  }
  cat("\n")
  if (errorCount > 0) {
    stop("Range violation occurred in the target correlation matrix!\n")
  }
  return(TRUE)
}

## ------------------------------------------------------------------------
ValidCorrGpois(matrix(c(1, 0.9, 0.9, 1), byrow = TRUE, nrow = 2), c(0.5, 0.5), c(0.1, 0.105))
ValidCorrGpois(matrix(c(1, 0.9, 0.9, 1), byrow = TRUE, nrow = 2), c(3, 2), c(-0.3, -0.2))

## ---- echo = FALSE-------------------------------------------------------
QuantileGpois = function(p, theta, lambda, details = FALSE){
  # Check if parameters are valid
  if(theta <= 0) stop("Theta has to be greater than 0!")
  if(lambda > 1) stop("Lambda has to be less than 1!")
  if(min(p) < 0 | max(p) > 1) stop("p must be between 0 and 1!")
  # since m >= 4, check lower bound for lambda when labda is negative
  if (lambda < 0 & lambda < (-theta)/4) stop (paste("For lambda<0, lambda must be >= -theta/4 = ", (-theta)/4, "!", sep=""))
  # Determine m
  m = numeric(1)
  if (lambda < 0) {
    mod = floor(-theta/lambda)
    if (-theta-mod * lambda == 0) m = mod
    else m = mod + 1
  }
  p.in = p
  upper = max(p.in)
  s = numeric(10000)
  q = numeric(length(p.in))
  w = exp(-lambda)
  #P(X = 0)
  p = exp(-theta)
  # s is for cumulative probability
  s[1] = p
  if (details) cat("x = 0, P(X = x) =",p, ",P(X <= x) =", s[1], "\n")
  i=1
  s[1] = as.numeric(p)
  if (details) cat("x = 0, P(X = x) =",p , ", P(X <= x) =", s[1], "\n")
  i = 1
  while (s[i] < upper) {
    #P(X = x)
    if (lambda < 0 & i > m) break
    else{
      p = theta * (theta + lambda * i)^(i - 1) * exp(-theta-lambda*i) / factorial(i)
      if(is.infinite(p)) {cat("error: p goes to infinite", "\n"); break  }
      if (i == 10000) {
        temp = numeric(10000)
        s = c(s, temp)
      }
        s[i + 1] = s[i] + p
        if (details) cat("x=", i, ", P(X = x) =", p, ", P(X <= x) =", s[i+1], "\n")
        i=i+1
     }
  }
  # For lambda < 0 to eliminate the truncation error ###
  if (lambda < 0) {
    Fm = s[i]
    s[1:i] = s[1:i] * Fm^(-1)
    if (details){
      cat("When lambda is negative, we need to account for truncation error\n")
      cat("The adjusted CDF are:", s[1:i])
      cat("\n")
    }
  }
  # quantile for x
  for (j in 1:length(p.in)) {
    i = 1
    while (p.in[j] > s[i]) {
      i = i + 1
    }
    q[j] = i - 1
  }
  return(q)
}

## ------------------------------------------------------------------------
QuantileGpois(0.98,1,-0.2,details = TRUE)
QuantileGpois(0.80,2,0.025,details = FALSE)

## ---- echo = FALSE-------------------------------------------------------
CorrNNGpois = function(theta.vec, lambda.vec, r) {
  if(abs(r) > 1) stop("The desired correlation r has to be within (-1,1)")
  samples = 1e+05
  u = GenUniGpois(theta.vec[1], lambda.vec[1], samples, method = "Inversion", details = FALSE)$data
  v = GenUniGpois(theta.vec[2], lambda.vec[2], samples, method = "Inversion", details = FALSE)$data
  maxcor = cor(sort(u), sort(v))
  mincor = cor(sort(u), sort(v, decreasing=TRUE))
  a = -maxcor * mincor/(maxcor + mincor)
  b = log((maxcor + a)/a)
  c = -a
  corrected = log( (r + a)/a )/b
  if( abs(corrected) > 1 ) cat("The actual correlation, ",corrected,", is not feasible!", sep = "")
  else{ return(corrected) }
}

## ------------------------------------------------------------------------
CorrNNGpois(c(0.1,10), c(0.1, 0.2),0.5)
CorrNNGpois(c(0.1,10), c(-0.01, -0.02),0.5)
CorrNNGpois(c(4,2.3), c(-0.32,-0.3),0.7)
CorrNNGpois(c(14,10), c(-0.8, -0.3),0.99)

## ---- echo = FALSE-------------------------------------------------------
CmatStarGpois = function(corMat, theta.vec, lambda.vec){
  no.gpois = length(theta.vec)
  if (ValidCorrGpois(corMat, theta.vec, lambda.vec)) {
    corMat.star = diag(nrow(corMat))
    for (i in 1:nrow(corMat)) {
      for (j in 1:no.gpois) {
        if (i != j) {
          corMat.star[i,j] = CorrNNGpois(c(theta.vec[i], theta.vec[j]),
                                          c(lambda.vec[i], lambda.vec[j]),
                                          corMat[i, j])
        }
        cat(".")
      }
    }
  }
  cat("\n")
  if (!is.positive.definite(corMat.star)) {
    warning("Intermediate correlation matrix is not positive definite. Nearest positive definite matrix is used!")
    corMat.star = as.matrix(nearPD(corMat.star, corr = TRUE, keepDiag = TRUE)$mat)
  }
  corMat.star = (corMat.star + t(corMat.star))/2
  return(corMat.star)
}

## ------------------------------------------------------------------------
lambda.vec = c(-0.2, 0.2, -0.3)
theta.vec = c(1, 3, 4)
M = c(0.352, 0.265, 0.342)
N = diag(3)
N[lower.tri(N)] = M
TV = N + t(N)
diag(TV) = 1
cstar = CmatStarGpois(TV, theta.vec, lambda.vec)
cstar

## ---- echo = FALSE-------------------------------------------------------
GenMVGpois = function(sample.size, no.gpois, cmat.star, theta.vec, lambda.vec, details = TRUE) {
  if (sample.size == 1 & details == TRUE) {
    stop("Parameter estimates are exactly the same as input of parameters in the case when n = 1!")
  }
  if (length(theta.vec) != no.gpois) {
    stop("Dimension of the theta vector does not match the number of generalized Poisson variables!\n")
  }
  if (length(lambda.vec) != no.gpois) {
    stop("Dimension of the lambda vector does not match the number of generalized Poisson variables!\n")
  }
  if (nrow(cmat.star) != no.gpois) {
    stop("Dimension of cmat.star and number of variables do not match!\n")
  }
  XX = rmvnorm(sample.size, rep(0, no.gpois), cmat.star)
  YY = NULL
  for (i in 1:no.gpois) {
    UU = pnorm(XX[, i])
    XXgpois = QuantileGpois(UU, theta.vec[i],lambda.vec[i])
    YY = cbind(YY, XXgpois)
  }
  colnames(YY) = NULL
  if (sample.size != 1) {
    model = vglm(YY ~ 1, genpoisson(zero = 1))
    coef = matrix(Coef(model), 2, 3)
    emp.theta = round(coef[2, ], 6)
    emp.lambda = round(coef[1, ], 6)
    emp.corr = cor(YY)
    if (details == TRUE) {
      my.res = list(data = YY,
                  specified.theta = theta.vec,
                  empirical.theta = emp.theta,
                  specified.lambda = lambda.vec,
                  empirical.lambda = emp.lambda,
                  specified.corr = cmat.star,
                  empirical.corr = emp.corr)
      print(my.res[2:6])
      return(my.res)
    }
  }
  if (details == FALSE) {
    return(YY)
  }
}

## ---- warning = FALSE----------------------------------------------------
sample.size = 10000; no.gpois = 3
lambda.vec = c(0.2, 0.2, 0.3); theta.vec = c(1, 3, 4)
M = c(0.352, 0.265, 0.342); N = diag(3); N[lower.tri(N)] = M
TV = N + t(N); diag(TV) = 1
cstar = CmatStarGpois(TV, theta.vec, lambda.vec)
data = GenMVGpois(sample.size, no.gpois, cstar, theta.vec, lambda.vec, details = FALSE)
apply(data, 2, mean) # empirical means
theta.vec / (1 - lambda.vec) # theoretical means
apply(data, 2, var) # empirical variances
theta.vec / (1 - lambda.vec)^3 # theoretical variances
cor(data) # empirical correlation matrix
TV # specified correlation matrix

