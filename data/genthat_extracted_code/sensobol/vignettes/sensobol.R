## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----creation_matrix-----------------------------------------------------
library(sensobol)

# Define settings -----------------------------------------

N <- 5000 # Sample size
k <- 8 # Number of parameters
params <- paste("X", 1:8, sep = "") # Vector with the name of the model inputs
R <- 100 # Number of bootstrap replicas

# Create the Sobol' matrices
A <- sobol_matrices(n = N, 
                    k = k,
                    second = TRUE, # We set a matrix for second-order effects
                    third = TRUE) # We set a matrix for third-order effects

# Compute model output ------------------------------------
Y <- sobol_Fun(A)

## ----plot_uncertainty, fig.height=3, fig.width=4-------------------------

# Plot distribution of model output -----------------------

plot_uncertainty(Y)

## ----plot_scatter, fig.height=6.5, fig.width=5---------------------------

# Scatterplots of model inputs vs. model output -----------

plot_scatter(x = A, 
             Y = Y, 
             n = N, 
             params = params)

## ----compute_sobol-------------------------------------------------------

# Compute Sobol' indices ----------------------------------

dt <- sobol_indices(Y = Y, 
                    params = params, 
                    type = "saltelli", 
                    R = R,
                    n = N, 
                    second = TRUE, 
                    third = TRUE)

## ----print_output--------------------------------------------------------

# Show output of the sobol_indices function ---------------

print(dt)

## ----boot_replicas, fig.height=5, fig.width=5, fig.cap="Distribution of the bootstrap replicas."----

# Access boot replicas ------------------------------------

# Copy data table
b.rep <- data.table::copy(dt)

# Retrieve
tmp1 <- b.rep[1:k, lapply(V1, function(x) x[["t"]])][
  , sensitivity:= rep(c("Si", "STi"), each = R)
  ]

# Melt
temp2 <- data.table::melt(tmp1, measure.vars = 1:k)

# Plot
plot_uncertainty(temp2[, value]) +
  ggplot2::facet_wrap(temp2[, sensitivity]~temp2[, variable], 
                      scales = "free_x") +
  ggplot2::labs(x = "Variance", 
                y = "Count") +
  ggplot2::scale_x_continuous(breaks = scales::pretty_breaks(n = 3))

## ----ci_sobol------------------------------------------------------------

# Compute confidence intervals ----------------------------

dt.ci <- sobol_ci(dt, 
                  params = params, 
                  type = "norm", 
                  conf = 0.95, 
                  second = TRUE, 
                  third = TRUE) 

## ----sobol_dummy---------------------------------------------------------

# Compute Sobol' indices of a dummy parameter -------------

dt.dummy <- sobol_dummy(Y = Y, 
                        params = params, 
                        R = R, 
                        n = N)

## ----sobol_dummy_ci------------------------------------------------------

# Compute confidence intervals for the dummy parameter ----

dt.dummy.ci <- sobol_ci_dummy(dt.dummy, 
                              type = "norm", 
                              conf = 0.95)

## ----plot_sobol_first, fig.height=3.5, fig.width=4.5, fig.cap="First and total-order Sobol' indices. The transparent, blue horizontal frame shows the approximation error for $S_{Ti}$, computed via a dummy parameter. Only the model inputs whose lower confidence interval for $S_{Ti}$ do not overlap the frame can be considered to truly have an interaction effect. The approximation error for $S_i$ is very small and can not be seen in the plot."----

# Plot Sobol' first and total-order indices -------------------------

plot_sobol(dt.ci, dummy = dt.dummy.ci, type = 1)

## ----plot_sobol_second, fig.height=3.5, fig.width=7.2--------------------

# Plot Sobol' second and third-order indices ------------------------

lapply(2:3, function(x) plot_sobol(dt.ci, type = x))

