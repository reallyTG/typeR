## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE, eval = TRUE------------------------------------------
library(ggplot2)
sim_groove <- function(beta = c(-0.28,0.28), a = 125)
{
  x <- seq(from = 0, to = 2158, by = 1)
  med <- median(x)
  y <- 1*(x <= a)*(beta[1]*(x - med) - beta[1]*(a - med)) + 
    1*(x >= 2158 - a)*(beta[2]*(x - med) - beta[2]*(2158 - a - med))
  return(data.frame("x" = x, "y" = y))
}

d <- sim_groove()
ggplot(data = d) +
  geom_line(aes(x = x, y = y), size = 2) +
  geom_text(mapping = aes(x = 300, y = 20, label = "GEA")) + 
  geom_text(mapping = aes(x = 1800, y = 20, label = "GEA")) +
  geom_text(mapping = aes(x = 2158/2, y = 5, label = "LEA")) +
  theme_bw() +
  ylab("Height") +
  xlab("Width")


## ----raw_data, echo=TRUE, cache=FALSE, fig.cap="\\label{f:raw_data} A plot of an averaged cross cut from a 3D bullet land scan.", eval = TRUE----
library(bulletcp)

data("example_data")
head(raw_data)
raw_data <- raw_data[seq(from = 1, to = nrow(raw_data), by = 30),]

ggplot(data = raw_data) +
  geom_point(aes(x = x, y = value)) +
  theme_bw() +
  ylab("Height") +
  xlab("Width")

## ----global_structure, echo=TRUE, cache=FALSE, eval = TRUE---------------

# set the minimum y-value to zero
check_min <- min(raw_data$value[!is.na(raw_data$value)])
raw_data <- dplyr::mutate(raw_data, value_std = value - check_min)

# remove global structure
rlo_fit <- robust_loess_fit(cc = raw_data, iter = 20)
raw_data$rlo_pred <- predict(rlo_fit, newdata = raw_data)
raw_data$rlo_resid <- raw_data$value_std - raw_data$rlo_pred

# define new data frame without the global structure
data <- data.frame("x" = raw_data$x, "y" = raw_data$rlo_resid)

# plot the new data
ggplot(data = data) +
  geom_point(aes(x = x, y = y)) +
  theme_bw() +
  ylab("Height") +
  xlab("Width")

## ----scale_yvals, echo=TRUE, eval = TRUE---------------------------------
# make range of x data equal to the range of non NA points and scale the y-values
d <- data.frame("x" = data$x, "y" = scale(data$y))
max_x_notNA <- max(d$x[!is.na(d$y)])
min_x_notNA <- min(d$x[!is.na(d$y)])
d <- d[d$x >= min_x_notNA & d$x <= max_x_notNA,]

## ----estimate_gp_par, echo = TRUE, cache=FALSE, eval = TRUE--------------
# subset data
temp_d <- d[seq(from = 1, to = nrow(d),by = 1),]

# remove missing data
temp_d <- temp_d[complete.cases(temp_d),]

# estimate the MLE's 
mles <- mlgp(y = temp_d$y, x = temp_d$x)

# name MLE's impute_par
impute_par <- exp(mles$par)
impute_par

## ----impute_values, echo = TRUE, cache = FALSE, eval = TRUE--------------
full_data <- imputeGP(y = d$y, x = d$x, sigma = impute_par[1], l = impute_par[2])
head(full_data)

ggplot(data = full_data) +
  geom_point(aes(x = x, y = y)) +
  theme_bw()

## ----cp0_gibbs, echo = TRUE, cache=FALSE, eval = TRUE--------------------
# log pdf of a normal distribution with the type of covariance matrix described in the model
lognormal_ou_pdf <- function(x, mu, sigma, l)
  {
    n <- length(x)
    rho <- exp(-1/l)

    return(-n/2 * log(2 * pi) - n * log(sigma) - ((n - 1)/2) * log(1 - rho^2)
           - 1/2 * 1/(sigma^2 * (1 - rho^2)) * ((x[1] - mu[1])^2 + (x[n] - mu[n])^2 + (1 + rho^2) * sum((x[2:(n-1)] - mu[2:(n-1)])^2)
                                                - 2 * rho * sum((x[1:(n-1)] - mu[1:(n-1)]) * (x[2:n] - mu[2:n]))))
}

# define starting values 
start.vals <- list("sigma" = c(1), "l" = c(10))

# proposal variance for the MH step
prop_var <- diag(c(1/2,1/2))

# run the RWMH sampler for the zero changepoint model
set.seed(1111)
m0cp <- runmcmc_cp0(data = full_data, iter = 1000, start.vals = start.vals, prop_var = prop_var, warmup = 500, verbose = FALSE)

# print maximum value of the (conditional) log posterior up to the normalizing constant
max(m0cp$lpost)

## ----cp1_gibbs_complicated, echo = TRUE, cache=FALSE, eval = TRUE--------

# define starting values for the changepoints
cp_start_left <- min(full_data$x) + 60
cp_start_right <- max(full_data$x) - 60
   
# define list of starting values for both the left and right changepoint models 
start.vals <- list("left" = list("sigma" = c(1,1), 
                                 "l" = c(10,10), 
                                 "cp" = c(cp_start_left), 
                                 "beta" = c(-1), 
                                 "intercept" = c(0)),
                    "right" = list("sigma" = c(1,1), 
                                   "l" = c(10,10), 
                                   "cp" = c(cp_start_right), 
                                   "beta" = c(1), 
                                   "intercept" = c(0)))

# list of starting values for each of the two MH steps (not sampling the changepoint) for both the left and right changepoint models 
prop_var <- list("left" = list(diag(c(1/2,1/2,1/2,1/2)), 
                               diag(c(1/2,1/2))),
                 "right" = list(diag(c(1/2,1/2)), 
                                diag(c(1/2,1/2,1/2, 1/2))))

# define the proposal variance for the RWMH step sampling the changepoint
cp_prop_var <- 10^2

# run Gibbs MCMC for the left GEA model 
set.seed(1111)
m1cp_left <- runmcmc_cp1_left(data = full_data, iter = 1000, warmup = 500, 
                            start.vals = start.vals$left, 
                            prop_var = prop_var$left, 
                            cp_prop_var = cp_prop_var, 
                            verbose = FALSE, tol_edge = 50)

# run Gibbs MCMC for the right GEA model
set.seed(1111)
m1cp_right <- runmcmc_cp1_right(data = full_data, iter = 1000, warmup = 500, 
                              start.vals = start.vals$right, 
                              prop_var = prop_var$right, 
                              cp_prop_var = cp_prop_var, 
                              verbose = FALSE, tol_edge = 50)

# Find MAP estimates under both models of the changepoint location 
map_cp1_left <- as.numeric(m1cp_left$parameters$cp)[which.max(m1cp_left$lpost)]
map_cp1_right <- as.numeric(m1cp_right$parameters$cp)[which.max(m1cp_right$lpost)]

# print maximum value of (conditional) log posterior up to a normalizing constant
max(m1cp_left$lpost)
max(m1cp_right$lpost)

# Plot the data and the changepoint MAPs
ggplot(data = full_data) +
  geom_point(aes(x = x, y = y)) + 
  geom_vline(aes(xintercept = map_cp1_left)) +
  geom_vline(aes(xintercept = map_cp1_right)) +
  theme_bw()


## ----cp1_gibbs_simple, echo = TRUE, cache=FALSE, eval = TRUE-------------

# run both Gibbs MCMC algorithms for each of the single changepoint model
set.seed(1111)
m1cp <- runmcmc_cp1(data = full_data, iter = 1000, 
                     start.vals.left = start.vals$left, 
                     start.vals.right = start.vals$right,
                     prop_var_left = prop_var$left, 
                     prop_var_right = prop_var$right, 
                     cp_prop_var = cp_prop_var, 
                     tol_edge = 50, 
                     warmup = 500, verbose = FALSE)

# Find MAP estimates under both models of the changepoint location 
map_cp1_left2 <- as.numeric(m1cp$left_parameters$cp)[which.max(m1cp$lpost$left)]
map_cp1_right2 <- as.numeric(m1cp$right_parameters$cp)[which.max(m1cp$lpost$right)]

map_cp1_left2
map_cp1_right2


## ----cp2_gibbs, echo = TRUE, cache=FALSE, eval = TRUE--------------------
# define starting values
start.vals <- list("sigma" = c(1,1,1), 
                   "l" = c(10,10,10), 
                   "cp" = c(cp_start_left, cp_start_right), 
                   "beta" = c(-2,2), 
                   "intercept" = c(0,0))

# define proposal variances (not for changepoints)
prop_var <- list(diag(c(1/2,1/2,1/2,1/2)), 
                 diag(c(1/2,1/2)), 
                 diag(c(1/2,1/2,1/2,1/2)))

# define proposal variance for changepoints
cp_prop_var <- diag(c(10^2, 10^2))

# run Gibbs MCMC
set.seed(1111)
m2cp <- runmcmc_cp2(data = full_data, 
                     iter = 1000, 
                     start.vals = start.vals, 
                     prop_var = prop_var, 
                     cp_prop_var = cp_prop_var, 
                     tol_edge = 50, 
                     tol_cp = 1000, 
                     warmup = 500, 
                     verbose = FALSE)


# Find MAP estimates of changepoint locations
map_cp2 <- m2cp$parameters$cp[which.max(m2cp$lpost),]

# print maximum value of (conditional) log posterior up to a normalizing constant
max(m2cp$lpost)

# Plot the data and the changepoint MAPs
ggplot(data = full_data) +
  geom_point(aes(x = x, y = y)) + 
  geom_vline(aes(xintercept = map_cp2[1])) +
  geom_vline(aes(xintercept = map_cp2[2])) +
  theme_bw()


## ----variable_cp_gibbs, echo = TRUE, cache=FALSE, eval = TRUE------------

# changepoint starting values
cp_sval_left <- min(full_data$x) + 60
cp_sval_right <- max(full_data$x) - 60

# list of starting values for each model
start.vals <- list("cp2" = list("sigma" = c(1,1,1), 
                                "l" = c(10,10,10), 
                                "cp" = c(cp_sval_left,cp_sval_right), 
                                "beta" = c(-2,2), 
                                "intercept" = c(0,0)),
                       "cp1" = list("left" = list(
                                        "sigma" = c(1,1), 
                                        "l" = c(10,10), 
                                        "cp" = c(cp_sval_left), 
                                        "beta" = c(-1), 
                                        "intercept" = c(0)),
                                    "right" = list(
                                        "sigma" = c(1,1), 
                                        "l" = c(10,10), 
                                        "cp" = c(cp_sval_right), 
                                        "beta" = c(1), 
                                        "intercept" = c(0))),
                       "cp0" = list("sigma" = c(1), "l" = c(10)))

# proposal variances for each model
prop_var <- list("cp2" = list(diag(c(1/2,1/2,1/2,1/2)), 
                              diag(c(1/2,1/2)), 
                              diag(c(1/2,1/2,1/2,1/2))),
                     "cp1" = list("left" = list(diag(c(1/2,1/2,1/2,1/2)), 
                                                diag(c(1/2,1/2))),
                                  "right" = list(diag(c(1/2,1/2)), 
                                                 diag(c(1/2,1/2,1/2, 1/2)))),
                     "cp0" = diag(c(1/2,1/2)))

# changepoint proposal variances 
cp_prop_var <- list("cp2" = diag(c(10^2, 10^2)),
                        "cp1" = 10^2)

# prior on the number of changepoints 
prior_numcp <- rep(1/4, times = 4)

set.seed(1111)
cp_gibbs <- runmcmc_cpall(data = full_data,
                                 start.vals = start.vals,
                                 prop_var = prop_var,
                                 cp_prop_var = cp_prop_var,
                                 verbose = FALSE,
                                 tol_edge = 50,
                                 tol_cp = 1000, 
                                 iter = 1000,
                                 warmup = 500,
                                 prior_numcp = prior_numcp)

# print the estimated maximum log posteriors
cp_gibbs$max_lpost

# Estimated groove locations in each model
cp_gibbs$cp_map


## ----detect_cp, echo = TRUE, cache = FALSE, eval = TRUE------------------

# Impute missing data, run MCMCs, and estimate MAPs
set.seed(1111)
cp_gibbs2 <- detect_cp(data = data,
                          start.vals = start.vals,
                          prop_var = prop_var,
                          cp_prop_var = cp_prop_var,
                          verbose = FALSE,
                          tol_edge = 50,
                          tol_cp = 1000, 
                          iter = 1000,
                          warmup = 500,
                          prior_numcp = prior_numcp,
                          est_impute_par = TRUE)


# print the estimated log posteriors
cp_gibbs2$changepoint_results$max_lpost

# Estimated groove locations in each model
cp_gibbs2$changepoint_results$cp_map

# The groove locations automatically chosen based on the MAP criteria
cp_gibbs2$grooves

## ----get_grooves_bcp, echo = TRUE, cache = FALSE, eval = TRUE------------
# Estimate the groove locations by supplying additional arguments 
cp_gibbs3 <- get_grooves_bcp(x = raw_data$x, value = raw_data$value, adjust = 10, iter = 1000)

# Estimated groove locations
cp_gibbs3$groove


