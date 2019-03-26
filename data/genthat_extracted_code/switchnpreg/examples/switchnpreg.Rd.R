library(switchnpreg)


### Name: switchnpreg
### Title: Fit a switching nonparametric regression model
### Aliases: switchnpreg
### Keywords: nonparametric regression switching latent

### ** Examples

  
  ## The motorcycle data set revisited ##
  
  x <- MASS::mcycle$times
  set.seed(30)
  x[duplicated(x)] <- round(jitter(x[duplicated(x)]),3)
  
  y <- MASS::mcycle$accel
  
  n <- length(y)
      
  spline_fit <- smooth.spline(x, y)
  
  ## set up the initial functions
  f.initial <- t(apply(as.matrix(spline_fit$y), 1,
                       `+`, c(30, 0, -30)))
  J <- ncol(f.initial)
  sig2 <- rep((sum((y-predict(spline_fit, x)$y)^2) / (n - spline_fit$df))/J, J)

  ## B and R parameters for penalized log-likelihood method
  basis <- create.bspline.basis(range(x), nbasis = 40)
  B <- getbasismatrix(x, basis)
  R <- getbasispenalty(basis)
    
  estimates <- switchnpreg(x = x, y = y,
                           f = f.initial,
                           alpha = rep(1, J) / J,
                           sigma2 = sig2,
                           lambda = rep(.5, J),
                           B = B, R = R,
                           var.equal = FALSE,
                           interval = log(c(1E-4, 1E3)),
  
                           eps.cv = rep(1E-1, J),
                           eps.em = rep(c(1E-1, 1E-2, 1E-3), each = J),
                           maxit.cv = 10,
                           maxit.em = 100)
  
  plot(x, y, ylim = c(-150,90),
       ylab = 'Head acceleration',
       xlab = 'Time')
  matlines(x, estimates$current$f, type='l', lty = 1, col = 1:J)
  matlines(sort(x), f.initial, lty = 2, col = 'gray')



