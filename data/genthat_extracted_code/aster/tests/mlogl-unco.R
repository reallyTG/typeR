
 library(aster)
 library(numDeriv)

 set.seed(42)

 nind <- 25
 nnode <- 5
 ncoef <- nnode + 1

 famlist <- fam.default()
 fam <- c(1, 1, 2, 3, 3)
 pred <- c(0, 1, 1, 2, 3)

 modmat <- array(0, c(nind, nnode, ncoef))
 modmat[ , , 1] <- 1
 for (i in 2:nnode)
     modmat[ , i, i] <- 1
 modmat[ , , ncoef] <- rnorm(nind * nnode)

 beta <- rnorm(ncoef) / 10

 phi <- matrix(modmat, ncol = ncoef) %*% beta
 phi <- matrix(phi, ncol = nnode)

 aster:::setfam(fam.default())

 theta <- .C(aster:::C_aster_phi2theta,
     nind = as.integer(nind),
     nnode = as.integer(nnode),
     pred = as.integer(pred),
     fam = as.integer(fam),
     phi = as.double(phi),
     theta = matrix(as.double(0), nind, nnode))$theta

 root <- sample(1:3, nind * nnode, replace = TRUE)
 root <- matrix(root, nind, nnode)

 x <- raster(theta, pred, fam, root)
 
 zip <- rep(0, nind * nnode)

 out <- mlogl(beta, pred, fam, x, root, modmat, deriv = 2,
     type = "unco", origin = zip)

 aster:::setfam(fam.default())

 a <- .C(aster:::C_aster_theta2phi,
     nind = as.integer(nind),
     nnode = as.integer(nnode),
     pred = as.integer(pred),
     fam = as.integer(fam),
     theta = as.double(zip),
     phi = matrix(as.double(0), nind, nnode))$phi

 M <- matrix(modmat, ncol = ncoef)

 alpha <- as.numeric(lm(as.numeric(a) ~ 0 + M)$coefficients)
 
 out.too <- mlogl(beta - alpha, pred, fam, x, root, modmat, deriv = 2,
     type = "unco")
 all.equal(out, out.too)

 beta.old <- beta
 beta <- beta - alpha

 my.value <- 0
 for (j in 1:nnode) {
     ifam <- fam[j]
     k <- pred[j]
     if (k > 0)
         xpred <- x[ , k]
     else
         xpred <- root[ , j]
     for (i in 1:nind)
         my.value <- my.value -
             sum(x[i, j] * theta[i, j] -
             xpred[i] * famfun(famlist[[ifam]], 0, theta[i, j]))
 }
 all.equal(out$value, my.value)

 foo <- function(beta) {
     stopifnot(is.numeric(beta))
     stopifnot(is.finite(beta))
     mlogl(beta, pred, fam, x, root, modmat, type = "unco")$value
 }

 g <- grad(foo, beta)
 all.equal(g, out$gradient)

 h <- hessian(foo, beta)
 all.equal(h, out$hessian)

 ##########

 objfun <- function(beta) {
     out <- mlogl(beta, pred, fam, x, root, modmat, deriv = 1,
         type = "unco")
     result <- out$value
     attr(result, "gradient") <- out$gradient
     return(result)
 }
 nout1 <- nlm(objfun, beta, fscale = nind)
 nout <- nlm(objfun, nout1$estimate, fscale = nind)
 all.equal(nout1$minimum, nout$minimum)
 all.equal(nout1$estimate, nout$estimate)

 beta.mle.new <- nout$estimate
 beta.mle.old <- beta.mle.new + alpha
 mout.new <- mlogl(beta.mle.new, pred, fam, x, root, modmat, deriv = 1,
         type = "unco")
 mout.old <- mlogl(beta.mle.old, pred, fam, x, root, modmat, deriv = 1,
         type = "unco", origin = zip)
 all.equal(mout.new, mout.old, tol = 1e-7)

 ##########

 objfun <- function(beta) {
     out <- mlogl(beta, pred, fam, x, root, modmat, deriv = 2,
         type = "unco")
     result <- out$value
     attr(result, "gradient") <- out$gradient
     attr(result, "hessian") <- out$hessian
     return(result)
 }
 nout1 <- nlm(objfun, beta, fscale = nind)
 nout <- nlm(objfun, nout1$estimate, fscale = nind, iterlim = 1000)
 all.equal(nout1$minimum, nout$minimum, tol = 1e-4)
 all.equal(nout1$estimate, nout$estimate, tol = 2e-2)

 objfun.old <- function(beta) {
     out <- mlogl(beta, pred, fam, x, root, modmat, deriv = 2,
         type = "unco", origin = zip)
     result <- out$value
     attr(result, "gradient") <- out$gradient
     attr(result, "hessian") <- out$hessian
     return(result)
 }
 nout.old <- nlm(objfun.old, beta.mle.old, fscale = nind, iterlim = 1000)
 all.equal(nout$minimum, nout.old$minimum)
 all.equal(nout$estimate, nout.old$estimate - alpha, tol = 1e-4)

