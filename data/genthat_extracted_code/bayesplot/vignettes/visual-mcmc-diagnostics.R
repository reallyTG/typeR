params <-
list(EVAL = TRUE)

## ---- SETTINGS-knitr, include=FALSE--------------------------------------
stopifnot(require("knitr"))
library("bayesplot")
knitr::opts_chunk$set(
  dev = "png",
  dpi = 150,
  fig.asp = 0.618,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center",
  comment = NA,
  eval = params$EVAL
)

## ---- pkgs, include=FALSE------------------------------------------------
library("bayesplot")
library("ggplot2")
library("rstan")
library("dplyr") #Used only for consistency checks
rstan_options(auto_write = TRUE) #Helpful throughout development

## ---- eval=FALSE---------------------------------------------------------
#  library("bayesplot")
#  library("ggplot2")
#  library("rstan")

## ---- schools_dat--------------------------------------------------------
schools_dat <- list(
  J = 8, 
  y = c(28,  8, -3,  7, -1,  1, 18, 12),
  sigma = c(15, 10, 16, 11,  9, 11, 10, 18)
)

## ---- compile-models, eval=FALSE-----------------------------------------
#  schools_mod_cp <- stan_model("schools_mod_cp.stan")
#  schools_mod_ncp <- stan_model("schools_mod_ncp.stan")

## ---- fit-models-hidden, results='hide', message=FALSE-------------------
fit_cp <- sampling(schools_mod_cp, data = schools_dat, seed = 803214054, control = list(adapt_delta = 0.95))
fit_ncp <- sampling(schools_mod_ncp, data = schools_dat, seed = 457721433, control = list(adapt_delta = 0.95))

## ---- extract-draws------------------------------------------------------
# Extract posterior draws for later use
posterior_cp <- as.array(fit_cp)
posterior_ncp <- as.array(fit_ncp)

## ---- available_mcmc-nuts------------------------------------------------
available_mcmc(pattern = "_nuts_")

## ---- extract-nuts-info--------------------------------------------------
lp_cp <- log_posterior(fit_cp)
head(lp_cp)
np_cp <- nuts_params(fit_cp)
head(np_cp)

# for the second model
lp_ncp <- log_posterior(fit_ncp)
np_ncp <- nuts_params(fit_ncp)

## ----echo=FALSE, warning=FALSE-------------------------------------------
# On rare ocasions, the fits may not be illustrative. Currently the seed is
# fixed, but if something in Stan changes and the fixed seeds produce unexpected
# results (which sould be rare), we want to know.
n_divergent_cp <- np_cp %>% filter(Parameter == "divergent__" & Value == 1) %>% nrow()
n_divergent_ncp <- np_ncp %>% filter(Parameter == "divergent__" & Value == 1) %>% nrow()

if(n_divergent_cp < 10 || n_divergent_cp > 2000) {
  stop("Unexpected number of divergences in the CP model. Change seed?")
}
if(n_divergent_ncp > 0) {
  stop("Divergences in the NCP model. Fix a bug / change seed?")
}


## ---- mcmc_parcoord-1----------------------------------------------------
color_scheme_set("darkgray")
mcmc_parcoord(posterior_cp, np = np_cp)

## ---- mcmc_pairs---------------------------------------------------------
mcmc_pairs(posterior_cp, np = np_cp, pars = c("mu","tau","theta[1]"))

## ---- mcmc_scatter-1-----------------------------------------------------
# assign to an object so we can reuse later
scatter_theta_cp <- mcmc_scatter(
  posterior_cp, 
  pars = c("theta[1]", "tau"), 
  transform = list(tau = "log"), # can abbrev. 'transformations'
  np = np_cp
)
scatter_theta_cp

## ---- mcmc_scatter-2-----------------------------------------------------
scatter_eta_ncp <- mcmc_scatter(
  posterior_ncp, 
  pars = c("eta[1]", "tau"), 
  transform = list(tau = "log"), 
  np = np_ncp
)
scatter_eta_ncp

## ---- mcmc_scatter-3-----------------------------------------------------
# A function we'll use several times to plot comparisons of the centered 
# parameterization (cp) and the non-centered parameterization (ncp). See
# help("bayesplot_grid") for details on the bayesplot_grid function used here.
compare_cp_ncp <- function(cp_plot, ncp_plot, ncol = 2, ...) {
  bayesplot_grid(
    cp_plot, ncp_plot, 
    grid_args = list(ncol = ncol),
    subtitles = c("Centered parameterization", 
                  "Non-centered parameterization"),
    ...
  )
}


scatter_theta_ncp <- mcmc_scatter(
  posterior_ncp, 
  pars = c("theta[1]", "tau"), 
  transform = list(tau = "log"), 
  np = np_ncp
)

compare_cp_ncp(scatter_theta_cp, scatter_theta_ncp, ylim = c(-9, 4))

## ---- mcmc_trace---------------------------------------------------------
color_scheme_set("mix-brightblue-gray")
mcmc_trace(posterior_cp, pars = "tau", np = np_cp) + 
  xlab("Post-warmup iteration")

## ----echo=FALSE----------------------------------------------------------
#A check that the chosen window still relevant
n_divergent_in_window <- np_cp %>% filter(Parameter == "divergent__" & Value == 1 & Iteration >= 350 & Iteration <= 500) %>% nrow()

if(n_divergent_in_window < 6) {
  divergences <- np_cp %>% filter(Parameter == "divergent__" & Value == 1) %>% select(Iteration) %>% get("Iteration", .) %>% sort() %>% paste(collapse = ",")
  stop(paste("Too few divergences in the selected window for traceplot zoom. Change the window or the random seed.\nDivergences happened at: ", divergences))
}

## ---- mcmc_trace_zoom----------------------------------------------------
mcmc_trace(posterior_cp, pars = "tau", np = np_cp, window = c(400,550)) + 
  xlab("Post-warmup iteration")

## ---- mcmc_nuts_divergence-----------------------------------------------
color_scheme_set("red")
mcmc_nuts_divergence(np_cp, lp_cp)

## ---- mcmc_nuts_divergence-chain-----------------------------------------
mcmc_nuts_divergence(np_cp, lp_cp, chain = 4)

## ---- mcmc_nuts_divergence-2---------------------------------------------
mcmc_nuts_divergence(np_ncp, lp_ncp)

## ---- fit-adapt-delta, results='hide', message=FALSE---------------------
fit_cp_2 <- sampling(schools_mod_cp, data = schools_dat,
                     control = list(adapt_delta = 0.999), seed = 978245244)
fit_ncp_2 <- sampling(schools_mod_ncp, data = schools_dat,
                      control = list(adapt_delta = 0.999), seed = 843256842)

## ----echo=FALSE, warning=FALSE-------------------------------------------
# On rare ocasions, the fits may not be illustrative. Currently the seed is fixed, but if something in Stan changes and the fixed seeds produce unexpected results (which sould be rare), we want to know.
n_divergent_cp_2 <- fit_cp_2 %>% nuts_params() %>% filter(Parameter == "divergent__" & Value == 1) %>% nrow()
n_divergent_ncp_2 <- fit_ncp_2 %>% nuts_params() %>% filter(Parameter == "divergent__" & Value == 1) %>% nrow()

if(n_divergent_cp_2 <= 0) {
  stop("No divergences in CP with increased adapt.delta. Change seed?")
}
if(n_divergent_ncp_2 > 0) {
  stop("Divergences in the NCP model. Fix a bug / change seed?")
}


## ---- mcmc_nuts_divergence-3---------------------------------------------
mcmc_nuts_divergence(nuts_params(fit_cp_2), log_posterior(fit_cp_2))
mcmc_nuts_divergence(nuts_params(fit_ncp_2), log_posterior(fit_ncp_2))

## ---- mcmc_nuts_energy-1, message=FALSE----------------------------------
color_scheme_set("red")
mcmc_nuts_energy(np_cp)

## ---- mcmc_nuts_energy-3, message=FALSE, fig.width=8---------------------
compare_cp_ncp(
  mcmc_nuts_energy(np_cp, binwidth = 1/2),
  mcmc_nuts_energy(np_ncp, binwidth = 1/2)
)

## ---- mcmc_nuts_energy-4, message=FALSE,  fig.width=8--------------------
np_cp_2 <- nuts_params(fit_cp_2)
np_ncp_2 <- nuts_params(fit_ncp_2)

compare_cp_ncp(
  mcmc_nuts_energy(np_cp_2), 
  mcmc_nuts_energy(np_ncp_2)
)

## ---- results='hide'-----------------------------------------------------
fit_cp_bad_rhat <- sampling(schools_mod_cp, data = schools_dat, 
                            iter = 50, init_r = 10, seed = 671254821)

## ----print-rhats---------------------------------------------------------
rhats <- rhat(fit_cp_bad_rhat)
print(rhats)

## ----echo=FALSE----------------------------------------------------------
#Check that the fit we got is a sensible example
if(all(rhats < 1.3)) {
  stop("All rhats for the short chain run are low. Change seed?")
}

## ----mcmc_rhat-1---------------------------------------------------------
color_scheme_set("brightblue") # see help("color_scheme_set")
mcmc_rhat(rhats)

## ---- mcmc_rhat-2--------------------------------------------------------
mcmc_rhat(rhats) + yaxis_text(hjust = 1)

## ---- mcmc_rhat-3--------------------------------------------------------
mcmc_rhat(rhat = rhat(fit_cp)) + yaxis_text(hjust = 0)

## ----print-neff-ratios---------------------------------------------------
ratios_cp <- neff_ratio(fit_cp)
print(ratios_cp)
mcmc_neff(ratios_cp, size = 2)

## ----mcmc_neff-compare---------------------------------------------------
neff_cp <- neff_ratio(fit_cp, pars = c("theta", "mu", "tau"))
neff_ncp <- neff_ratio(fit_ncp, pars = c("theta", "mu", "tau"))
compare_cp_ncp(mcmc_neff(neff_cp), mcmc_neff(neff_ncp), ncol = 1)

## ----mcmc_acf, out.width = "70%"-----------------------------------------
compare_cp_ncp(
  mcmc_acf(posterior_cp, pars = "theta[1]", lags = 10),
  mcmc_acf(posterior_ncp, pars = "eta[1]", lags = 10)
)

