## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message = FALSE, eval = TRUE---------------------------------------
# Load R package mlergm
library(mlergm)

# Networks can be created in the same was as other packages 
net <- network.initialize(90, directed = FALSE)

# The difference with mlergm is that we also have a block membership structure 
node_memb <- c(rep(1, 30), rep(2, 30), rep(3, 30))

## ---- echo = FALSE, eval = TRUE------------------------------------------
load("vig_data.rda")

## ---- fig.width = 4, fig.height = 3, out.width = "50%", dpi = 300, fig.align = "center", eval = FALSE----
#  # Simulate a network from the edge + gwesp model
#  net <- simulate_mlnet(form = net ~ edges + gwesp,
#                        node_memb = node_memb,
#                        seed = 123,
#                        theta = c(-3, 1, .5))
#  plot(net)

## ---- fig.width = 4, fig.height = 3, out.width = "50%", dpi = 300, fig.align = "center", eval = TRUE, echo = FALSE----
plot(net)

## ---- fig.width = 6, fig.height = 3, fig.align = "center", out.width = "80%", out.height = "30%", dpi = 300----
# Let us use the sampson data set as an example 
data(sampson)
sampson_net <- mlnet(network = samplike, 
                     node_memb = get.vertex.attribute(samplike, "group"))
plot(sampson_net, arrow.size = 2.5, arrow.gap = 0.025)

## ---- eval = FALSE-------------------------------------------------------
#  # Estimate the edge + gwesp model for the simulated network
#  model_est <- mlergm(net ~ edges + gwesp, verbose = 0, seed = 123)

## ---- eval = TRUE, echo = TRUE-------------------------------------------
summary(model_est)

## ---- fig.width = 8, fig.height = 4.5, fig.align = "center", out.height = "70%", out.width = "90%", dpi = 300, eval = FALSE----
#  # We can call the gof.mlergm method directly by calling 'gof' on an object of class 'mlergm'
#  gof_res <- gof(model_est)
#  plot(gof_res, cutoff = 15, pretty_x = TRUE)

## ---- fig.width = 8, fig.height = 4.5, fig.align = "center", out.height = "70%", out.width = "90%", dpi = 300, eval = TRUE, echo = FALSE----
plot(gof_res, cutoff = 15, pretty_x = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  offset_est <- mlergm(sampson_net ~ edges + mutual,
#                       seed = 123,
#                       parameterization = "offset")

## ---- eval = TRUE--------------------------------------------------------
summary(offset_est)

## ---- eval = FALSE-------------------------------------------------------
#  mlergm(net ~ edges + gwesp,
#         options = set_options(burnin = 5000, interval = 500, sample_size = 2500))

## ---- eval = FALSE-------------------------------------------------------
#  mlergm(net ~ edges + gwesp,
#         options = set_options(number_cores = 3))

## ---- eval = FALSE-------------------------------------------------------
#  # Adjust the step length manually
#  mlergm(net ~ edges + gwesp,
#         options = set_options(step_len = 0.25))
#  
#  # Use the naive adaptive step length
#  mlergm(net ~ edges + gwesp,
#         options = set_options(adaptive_step_len == TRUE))

## ---- eval = FALSE-------------------------------------------------------
#  mlergm(net ~ edges + gwesp,
#         options = set_options(MCMLE_max_iter = 10,
#                               NR_max_iter = 100,
#                               NR_tol = 1e-4))

