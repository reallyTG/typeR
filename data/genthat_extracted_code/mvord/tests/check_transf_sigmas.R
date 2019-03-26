library(mvord)

#check z2r
mvord:::check(identical(mvord:::z2r(355),1))
mvord:::check(identical(mvord:::z2r(0),(exp(0)-1)/(1+exp(0))))
mvord:::check(identical(mvord:::z2r(2),(exp(4)-1)/(1+exp(4))))

error.structure <- cor_ar1(~ 1)
ndim <- 5
covar_error <- matrix(rep(1,10), ncol = 1)

attr(error.structure, "ndim") <- ndim
attr(error.structure, "covariate") <- covar_error
attr(error.structure, "npar") <- NCOL(attr(error.structure, "covariate"))

par.sigma <- 2
sigma <- diag(ndim)
sigma[lower.tri(sigma)]   <- mvord:::z2r(par.sigma)^sequence((ndim-1):1)
sigma <- sigma + t(sigma) - diag(diag(sigma))
## make list with two elemets:
## rVec: for each row the sigma[lower.tri(sigma)]
## sdVec: for correlation a vector of ones
l <- list(rVec = t(sapply(1:10, function(i) sigma[lower.tri(sigma)])),
	 sdVec = rep(1, ndim))

mvord:::check(identical(mvord:::build_error_struct.cor_ar1(error.structure, par.sigma), l))

# rho$ncor.levels <- 2
# rho$npar.cor <- 1
# par.sigma <- c(2,0)
#
# sigma <- diag(rho$ndim)
# sigma[lower.tri(sigma)]   <- z2r(par.sigma[1])^sequence((rho$ndim-1):1)
# sigma <- sigma + t(sigma) - diag(diag(sigma))
#
# sigma2 <- diag(rho$ndim)
# sigma2[lower.tri(sigma2)]   <- z2r(par.sigma[2])^sequence((rho$ndim-1):1)
# sigma2 <- sigma2 + t(sigma2) - diag(diag(sigma2))
#
# check(identical(transf.sigmas.corAR1(par.sigma, rho), list(sigma, sigma2)))

error.structure <- cor_equi(~ 1)
ndim <- 5
covar_error <- cbind(1:10,11:20,21:30)

attr(error.structure, "ndim") <- ndim
attr(error.structure, "covariate") <- covar_error
attr(error.structure, "npar") <- NCOL(attr(error.structure, "covariate"))


par.sigma <- c(1,2,-3)
sigma <- diag(ndim)
sigma[lower.tri(sigma)]   <- mvord:::z2r(covar_error %*% par.sigma)
sigma <- sigma + t(sigma) - diag(diag(sigma))
sigma
## make list with two elemets:
## rVec: for each row the sigma[lower.tri(sigma)]
## sdVec: for correlation a vector of ones
l <- list(rVec = t(sapply(1:10, function(i) sigma[lower.tri(sigma)])),
	 sdVec = rep(1, ndim))

mvord:::check(identical(mvord:::build_error_struct.cor_equi(error.structure, par.sigma), l))


par.sigma <- c(0.1,0.2,-0.3)
sigma <- diag(ndim)
sigma[lower.tri(sigma)]   <- mvord:::z2r(covar_error %*% par.sigma)
sigma <- sigma + t(sigma) - diag(diag(sigma))
l <- list(rVec = t(sapply(1:10, function(i) sigma[lower.tri(sigma)])),
	 sdVec = rep(1, ndim))

mvord:::check(identical(mvord:::build_error_struct.cor_equi(error.structure, par.sigma), l))


# spherical param
error.structure <- cor_general(~ 1)
ndim <- 3
covar_error <- cbind(rep(1, 10))

attr(error.structure, "ndim") <- ndim
attr(error.structure, "covariate") <- covar_error
npar1 <- attr(error.structure, "ndim") * (attr(error.structure, "ndim") - 1)/2
attr(error.structure, "npar") <- npar1 * NCOL(attr(error.structure, "covariate"))

par.sigma <- c(0.5, 1, 2)
l <-  mvord:::build_error_struct.cor_general(error.structure, par.sigma)
sigma <- diag(ndim)
sigma[lower.tri(sigma)]   <- l$rVec[1,]
sigma <- sigma + t(sigma) - diag(diag(sigma))

mvord:::check(all.equal(mvord:::backtransf_sigmas(sigma), par.sigma))

#check for cor_general(~f)
error.structure <- cor_general(~ factor(c(rep("a", 5), rep("b", 5))))
ndim <- 3
covar_error <- cbind(c(rep(1, 5), rep(0,5)), c(rep(0, 5), rep(1, 5)))

attr(error.structure, "ndim") <- ndim
attr(error.structure, "covariate") <- covar_error
npar1 <- attr(error.structure, "ndim") * (attr(error.structure, "ndim") - 1)/2
attr(error.structure, "npar") <- npar1 * NCOL(attr(error.structure, "covariate"))

par.sigma <- c(0.5, 1, 2, -0.5, -1, -2)
l <-  mvord:::build_error_struct.cor_general(error.structure, par.sigma)
sigma1 <- diag(ndim)
sigma1[lower.tri(sigma1)]   <- l$rVec[1,]
sigma1 <- sigma1 + t(sigma1) - diag(ndim)

sigma2 <- diag(ndim)
sigma2[lower.tri(sigma2)]   <- l$rVec[6,]
sigma2 <- sigma2 + t(sigma2) - diag(ndim)


mvord:::check(all.equal(mvord:::backtransf_sigmas(sigma1), par.sigma[1:3]))
mvord:::check(all.equal(mvord:::backtransf_sigmas(sigma2), par.sigma[4:6]))


#check for cov_general(~f)
error.structure <- cov_general(~ factor(c(rep("a", 5), rep("b", 5))))
ndim <- 3
covar_error <- cbind(c(rep(1, 5), rep(0,5)), c(rep(0, 5), rep(1, 5)))

attr(error.structure, "ndim") <- ndim
attr(error.structure, "covariate") <- covar_error
npar1 <- attr(error.structure, "ndim") * (attr(error.structure, "ndim") - 1)/2
attr(error.structure, "npar") <- (npar1 + ndim)* NCOL(attr(error.structure, "covariate"))
attr(error.structure, "npar.cor") <- npar1* NCOL(attr(error.structure, "covariate"))
attr(error.structure, "npar.sd") <-  ndim * NCOL(attr(error.structure, "covariate"))

## new
attr(error.structure, "npar.cor") <- ndim * (ndim - 1)/2 * NCOL(covar_error)
##
par.sigma <- c(0.5, 1, 2, -0.5, -1, -2, c(-1, 0.2, 0.5), c(1, -0.2, -0.5))
l <-  mvord:::build_error_struct.cov_general(error.structure, par.sigma)
l
sigma1 <- diag(ndim)
sigma1[lower.tri(sigma1)]   <- l$rVec[1,]
sigma1 <- (sigma1 + t(sigma1) - diag(ndim))
sigma1 <- t(l$sdVec[1, ] * sigma1) * l$sdVec[1, ]
sigma2 <- diag(ndim)
sigma2[lower.tri(sigma2)]   <- l$rVec[6,]
sigma2 <- sigma2 + t(sigma2) - diag(ndim)
sigma2 <- t(l$sdVec[6, ] * sigma2) * l$sdVec[6, ]

sigma1
sigma2

mvord:::check(all.equal(c(mvord:::backtransf_sigmas(cov2cor(sigma1)), diag(sigma1)),
	c(par.sigma[1:3], exp(2 * par.sigma[7:9]))))
mvord:::check(all.equal(c(mvord:::backtransf_sigmas(cov2cor(sigma2)), diag(sigma2)),
	c(par.sigma[4:6], exp(2 * par.sigma[10:12]))))

