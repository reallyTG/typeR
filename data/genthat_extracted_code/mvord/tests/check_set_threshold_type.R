library(mvord)
rho <- list()
rho$ndim <- 5

rho$error.structure$type <- "correlation"
rho$intercept.type = "fixed"
#rho$ntheta <- 1:5
#rho$threshold.values <- lapply(1:rho$ndim, function(j) rep(NA,rho$ntheta[j]))
rho$threshold.values <- list(c(NA),
                             c(NA,NA),
                             c(NA,NA,NA),
                             c(NA,NA,NA,NA),
                             c(NA,NA,NA,NA,NA))
rho$formula <- y ~ 0 + X1 + X2 + X3
rho$intercept = FALSE
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(identical(mvord:::set_threshold_type(rho), "flexible"))

rho$error.structure$type <- "correlation"
rho$threshold.values <- list(c(1),
                             c(2,NA),
                             c(3,NA,NA),
                             c(4,NA,NA,NA),
                             c(5,NA,NA,NA,NA))
rho$formula <- y ~ X1 + X2 + X3
rho$intercept = TRUE
rho$intercept.type = "flexible"
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(identical(mvord:::set_threshold_type(rho), "fix1first"))

rho$error.structure$type <- "correlation"
rho$threshold.values <- list(c(1),
                             c(2,3),
                             c(3,4,NA),
                             c(4,5,NA,NA),
                             c(5,6,NA,NA,NA))
rho$formula <- y ~ X1 + X2 + X3
rho$intercept = TRUE
rho$intercept.type = "flexible"
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(identical(mvord:::set_threshold_type(rho), "fix2first"))

rho$error.structure$type <- "covariance"
rho$threshold.values <- list(c(1),
                             c(2,3),
                             c(3,4,NA),
                             c(4,5,NA,NA),
                             c(5,6,NA,NA,NA))
rho$formula <- y ~ X1 + X2 + X3
rho$intercept = TRUE
rho$intercept.type = "flexible"
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
rho$binary <- TRUE
#error here
mvord:::check(!is.null(attr(try(
  mvord:::set_threshold_type(rho)
  , silent = TRUE), "condition")))

rho$error.structure$type <- "covariance"
rho$threshold.values <- list(c(1),
                             c(2,3),
                             c(3,NA,4),
                             c(4,NA,NA,5),
                             c(5,NA,NA,NA,6))
rho$formula <- y ~ X1 + X2 + X3
rho$intercept = TRUE
rho$intercept.type = "flexible"
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
#error here
#check(identical(set_threshold_type(rho), "fix2firstlast"))
mvord:::check(!is.null(attr(try(
  mvord:::set_threshold_type(rho)
  , silent = TRUE), "condition")))


rho$error.structure$type <- "correlation"
rho$threshold.values <- list(c(1),
                             c(2,3),
                             c(3,NA,4),
                             c(4,NA,NA,5),
                             c(5,NA,NA,NA,6))
rho$formula <- y ~ X1 + X2 + X3
rho$intercept = TRUE
rho$intercept.type = "flexible"
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(identical(mvord:::set_threshold_type(rho), "fix2firstlast"))

rho$error.structure$type <- "covariance"
rho$threshold.values <- list(c(1),
                             c(2,NA),
                             c(3,NA,NA),
                             c(4,NA,NA,NA),
                             c(5,NA,NA,NA,NA))
rho$formula <- y ~ 0 + X1 + X2 + X3
rho$intercept = FALSE
rho$intercept.type = "fixed"
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(identical(mvord:::set_threshold_type(rho), "fix1first"))
#----------------------------------------------------------------------------------------------------
#ERRORS
rho$error.structure$type <- "covariance"
rho$intercept.type = "fixed"
rho$threshold.values <- list(c(NA),
                             c(NA,NA),
                             c(NA,NA,NA),
                             c(NA,NA,NA,NA),
                             c(NA,NA,NA,NA,NA))
rho$formula <- y ~ 0 + X1 + X2 + X3
rho$intercept = FALSE
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(!is.null(attr(try(mvord:::set_threshold_type(rho), silent = TRUE), "condition")))

# e <- try(set_threshold_type(rho), silent = TRUE)
# e <- try(stop("throwing a try-error"))
# !is.null(attr(e, "condition"))
# !is.null(attr(try(set_threshold_type(rho), silent = TRUE), "condition"))

rho$error.structure$type <- "covariance"
rho$intercept.type = "flexible"
rho$threshold.values <- list(c(1),
                             c(2,NA),
                             c(3,NA,NA),
                             c(4,NA,NA,NA),
                             c(5,NA,NA,NA,NA))
rho$formula <- y ~ 1 + X1 + X2 + X3
rho$intercept = TRUE
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(!is.null(attr(try(mvord:::set_threshold_type(rho), silent = TRUE), "condition")))

rho$error.structure$type <- "correlation"
rho$intercept.type = "flexible"
rho$threshold.values <- list(c(NA),
                             c(NA,NA),
                             c(NA,NA,NA),
                             c(NA,NA,NA,NA),
                             c(NA,NA,NA,NA,NA))
rho$formula <- y ~ 1 + X1 + X2 + X3
rho$intercept = TRUE
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(!is.null(attr(try(mvord:::set_threshold_type(rho), silent = TRUE), "condition")))

rho$error.structure$type <- "correlation"
rho$threshold.values <- list(c(1),
                             c(2,NA),
                             c(3,4,5),
                             c(4,NA,NA,NA),
                             c(5,NA,NA,NA,NA))
rho$formula <- y ~ X1 + X2 + X3
rho$intercept = TRUE
rho$intercept.type = "flexible"
rho$ntheta <- sapply(seq_len(rho$ndim), function(j) length(rho$threshold.values[[j]]))
mvord:::check(!is.null(attr(try(mvord:::set_threshold_type(rho), silent = TRUE), "condition")))
