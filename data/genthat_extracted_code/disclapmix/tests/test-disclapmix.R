context("disclapmix")

# https://bugs.r-project.org/bugzilla/show_bug.cgi?id=17494
suppressWarnings(RNGversion("3.5.0"))

ESTIMATION_TOL_DUE_TO_SAMPLING <- 1e-3

##################################################
# One center, one locus
##################################################
set.seed(1)
p <- 0.3 # Dispersion parameter 
y <- 13 # Location parameter 
x <- disclap::rdisclap(1000, p) + y # Generate a sample using the rdisclap function

y_hat <- median(x)
mu_hat <- mean(abs(x - y_hat))
p_hat <- mu_hat^(-1) * (sqrt(mu_hat^2 + 1) - 1)

test_that("rdisclap", {
  expect_equal(y_hat, y)
  expect_equal(p_hat, p, tol = ESTIMATION_TOL_DUE_TO_SAMPLING)
})

xmat <- as.matrix(as.integer(x))

init_y <- 12L
fit <- disclapmix(x = xmat, 
                  clusters = 1L, 
                  init_y = matrix(init_y), 
                  init_y_method = NULL)

test_that("disclapmix 1 center 1 locus", {
  expect_equal(as.integer(fit$init_y), init_y)
  expect_equal(as.integer(fit$y), y)
  expect_equal(c(fit$disclap_parameters), p, tol = ESTIMATION_TOL_DUE_TO_SAMPLING)
  expect_equal(c(fit$disclap_parameters), p_hat)
  expect_output(print(fit), "disclapmixfit from 1000 observations on 1 loci with 1 clusters.", 
                fixed = TRUE)
  expect_output(summary(fit), "disclapmixfit from 1000 observations on 1 loci with 1 clusters.

EM converged:                                                       FALSE
Number of central haplotype changes:                                0
Total number of EM iterations:                                      2
Model observations (n*loci*clusters):                               1000
Model parameters ((clusters*loci)+(loci+clusters-1)+(clusters-1)):  2
GLM method:                                                         internal_coef
Initial central haplotypes supplied:                                TRUE", 
                fixed = TRUE)
})

clusprob <- clusterprob(fit, xmat)
test_that("clusterprob", {
  expect_equal(1L, length(unique(clusprob)))
  expect_equal(rep(0, nrow(xmat)), c(abs(clusprob - 1)))
})

test_that("clusterdist", {
  expect_error(clusterdist(fit))
})

##################################################
# Multiple centres, multiple loci -- some overlap
##################################################
set.seed(1)
ps_loc <- c(0.3, 0.2, 0.4)
ps_ys <- c(0.1, 0)
ys <- matrix(c(13L, 19L, 20L,
               13L, 20L, 22L), nrow = 2L, byrow = TRUE) # Location parameter 
tau <- c(0.2, 0.8)
N <- 1000L
z <- sample(seq_along(tau), N, prob = tau, replace = TRUE)
x <- do.call(cbind, lapply(seq_along(ps_loc), function(k) {
  p <- ps_loc[k] + ps_ys[z]
  return(disclap::rdisclap(N, p) + ys[z, k])
}))

fit <- disclapmix(x = x, clusters = 2L)

order_by_ys_true <- order(ys[, 1L], ys[, 2L], ys[, 3L])
order_by_ys_fit <- order(fit$y[, 1L], fit$y[, 2L], fit$y[, 3L])

p_true <- outer(ps_ys, ps_loc, "+")[order_by_ys_true, ]
p_fit <- fit$disclap_parameters[order_by_ys_fit, ]
dimnames(p_fit) <- NULL

y_true <- ys[order_by_ys_true, ]
y_fit <- fit$y[order_by_ys_fit, ]
dimnames(y_fit) <- NULL

test_that("disclapmix multiple centers multiple loci", {
  expect_equal(p_true, p_fit, tol = 1e-1)
  expect_equal(y_true, y_fit)
})


test_that("clusterprob", {
  expect_equal(clusterprob(fit, x), fit$v_matrix, tol = 1e-3)
})



##################################################
# Estimation methods
##################################################

fit_std_int_coef <- disclapmix(x = x, clusters = 2L, glm_method = "internal_coef")
fit_std_int_dev <- disclapmix(x = x, clusters = 2L, glm_method = "internal_dev")
fit_std_glmfit <- disclapmix(x = x, clusters = 2L, glm_method = "glm.fit")

# reordering
order_int_coef <- order(fit_std_int_coef$y[, 1L], fit_std_int_coef$y[, 2L], fit_std_int_coef$y[, 3L])
order_int_dev <- order(fit_std_int_dev$y[, 1L], fit_std_int_dev$y[, 2L], fit_std_int_dev$y[, 3L])
order_glmfit <- order(fit_std_glmfit$y[, 1L], fit_std_glmfit$y[, 2L], fit_std_glmfit$y[, 3L])

test_that("disclapmix multiple centers multiple loci", {
  expect_equal(fit_std_int_coef$y[order_int_coef, ], 
               fit_std_int_dev$y[order_int_dev, ])
  expect_equal(fit_std_int_coef$y[order_int_coef, ], 
               fit_std_glmfit$y[order_glmfit, ])
  
  expect_equal(fit_std_int_coef$disclap_parameters[order_int_coef, ], 
               fit_std_int_dev$disclap_parameters[order_int_dev, ], tol = 1e-6)
  expect_equal(fit_std_int_coef$disclap_parameters[order_int_coef, ], 
               fit_std_glmfit$disclap_parameters[order_glmfit, ], tol = 1e-6)
})



test_that("clusterdist", {
  expect_equal(clusterdist(fit_std_int_coef), clusterdist(fit_std_int_dev), tol = 1e-6)
})


clusterwise_probs <- predict_clusterwise(fit, newdata = x)

pred_man <- apply(clusterwise_probs, 1, function(p) sum(fit$tau*p))


test_that("predict", {
  expect_equal(predict(fit_std_int_coef, newdata = x), predict(fit_std_int_dev, newdata = x), tol = 1e-6)
  expect_equal(predict(fit_std_int_coef, newdata = x), predict(fit_std_glmfit, newdata = x), tol = 1e-6)
  expect_equal(predict(fit_std_int_coef, newdata = x), pred_man)
})



##################################################
# Simulate
##################################################
sim <- simulate(fit_std_int_coef, 1000L)
sim_fit <- disclapmix(x = sim, clusters = 2L, glm_method = "internal_coef")

test_that("simulate", {
  expect_equal(sim_fit$disclap_parameters, fit_std_int_coef$disclap_parameters, tol = 1e-1)
  expect_equal(sim_fit$y, fit_std_int_coef$y)
})




##################################################
# Multiple centres, multiple loci -- more difference between components
##################################################
set.seed(1)
ps_loc <- c(0.2, 0.2, 0.2)
ps_ys <- c(0.1, 0)
ys <- matrix(c(10L, 10L, 10L,
               13L, 13L, 13L), nrow = 2L, byrow = TRUE) # Location parameter 
tau <- c(0.2, 0.8)
N <- 1000L
z <- sample(seq_along(tau), N, prob = tau, replace = TRUE)
x <- do.call(cbind, lapply(seq_along(ps_loc), function(k) {
  p <- ps_loc[k] + ps_ys[z]
  return(disclap::rdisclap(N, p) + ys[z, k])
}))

fit <- disclapmix(x = x, clusters = 2L)

order_by_ys_true <- order(ys[, 1L], ys[, 2L], ys[, 3L])
order_by_ys_fit <- order(fit$y[, 1L], fit$y[, 2L], fit$y[, 3L])

p_true <- outer(ps_ys, ps_loc, "+")[order_by_ys_true, ]
p_fit <- fit$disclap_parameters[order_by_ys_fit, ]
dimnames(p_fit) <- NULL

y_true <- ys[order_by_ys_true, ]
y_fit <- fit$y[order_by_ys_fit, ]
dimnames(y_fit) <- NULL

test_that("disclapmix multiple centers multiple loci", {
  expect_equal(p_true, p_fit, tol = 1e-1)
  expect_equal(y_true, y_fit)
})

# Also vmatrix
v_true <- matrix(0, nrow = N, ncol = nrow(fit$y))
for (i in 1L:N) v_true[i, z[i]] <- 1
v_fit <- fit$v_matrix[, order_by_ys_fit]

test_that("disclapmix v matrix", {
  expect_true(mean(abs(v_true - v_fit)) < 0.05)
})


##################################################
# Others
##################################################

test_that("rcpp_find_haplotype_in_matrix", {
  expect_equal(1L, find_haplotype_in_matrix(x, x[1L, ]))
  expect_equal(33L, find_haplotype_in_matrix(x, x[33L, ]))
  expect_null(find_haplotype_in_matrix(x, rep(1000L, ncol(x))))
})

test_that("disclapglm_linkfun/disclapglm_mu_eta", {
  expect_true(disclapglm_linkfun(0.1) < 0)
  expect_true(disclapglm_mu_eta(-2) < 1)
  expect_equal(0.1, disclapglm_mu_eta(disclapglm_linkfun(0.1)), tol = 1e-3)
})

test_that("convert_to_compact_db", {
  expect_equal(nrow(x), sum(convert_to_compact_db(x)$Ndb))
})

##################################################
# Errors
##################################################

test_that("disclapmix should give error", {
  expect_error(disclapmix(x, centers = 4L))
  expect_error(disclapmix(x, use.parallel = TRUE))
  expect_error(disclapmix(x, calculate.logLs = TRUE))
  expect_error(disclapmix(x, plots.prefix = 'foo'))
  expect_error(disclapmix(x, clusters = NULL))
  expect_error(disclapmix(x, clusters = -1))
  expect_error(disclapmix(x, clusters = 2.1))
  
  expect_error(simulate(fit_std_int_coef, 100))
  
  expect_error(convert_to_compact_db(c()))
  
  expect_error(check_x(data.frame(x = 1:10)))
  expect_error(check_x(matrix(1L:10L, nrow = 1L)))
  
  expect_error(check_y(data.frame(x = 1:10), clusters = 0L, loci = 10L))
  expect_error(check_y(matrix(1L:10L, nrow = 1L), clusters = 0L, loci = 10L))
  expect_error(check_y(matrix(1L:10L, nrow = 1L), clusters = 0L, loci = 2L))
})

