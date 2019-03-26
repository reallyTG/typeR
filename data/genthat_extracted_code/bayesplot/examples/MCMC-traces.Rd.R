library(bayesplot)


### Name: MCMC-traces
### Title: Trace plot (time series plot) of MCMC draws
### Aliases: MCMC-traces mcmc_trace mcmc_trace_highlight trace_style_np

### ** Examples

# some parameter draws to use for demonstration
x <- example_mcmc_draws(chains = 4, params = 6)
dim(x)
dimnames(x)

# trace plots of the betas
color_scheme_set("viridis")
mcmc_trace(x, regex_pars = "beta")
## No test: 
color_scheme_set("viridisA")
mcmc_trace(x, regex_pars = "beta")

color_scheme_set("viridisC")
mcmc_trace(x, regex_pars = "beta")
## End(No test)

# mix color schemes
color_scheme_set("mix-blue-red")
mcmc_trace(x, regex_pars = "beta")

# use traditional ggplot discrete color scale
mcmc_trace(x, pars = c("alpha", "sigma")) +
 ggplot2::scale_color_discrete()

# zoom in on a window of iterations, increase line size,
# add tick marks, move legend to the top, add gray background
color_scheme_set("viridisA")
mcmc_trace(x[,, 1:4], window = c(100, 130), size = 1) +
  panel_bg(fill = "gray90", color = NA) +
  legend_move("top")

## Not run: 
##D # parse facet label text
##D color_scheme_set("purple")
##D p <- mcmc_trace(
##D   x,
##D   regex_pars = "beta\\[[1,3]\\]",
##D   facet_args = list(labeller = ggplot2::label_parsed)
##D )
##D p + facet_text(size = 15)
##D 
##D # mark first 100 draws as warmup
##D mcmc_trace(x, n_warmup = 100)
##D 
##D # plot as points, highlighting chain 2
##D color_scheme_set("brightblue")
##D mcmc_trace_highlight(x, pars = "sigma", highlight = 2, size = 2)
##D 
##D # for models fit using HMC/NUTS divergences can be displayed in the trace plot
##D library("rstanarm")
##D fit <- stan_glm(mpg ~ ., data = mtcars,
##D   # next line to keep example fast and also ensure we get some divergences
##D                 prior = hs(), iter = 400, adapt_delta = 0.8)
##D 
##D # extract draws using as.array (instead of as.matrix) to keep
##D # chains separate for trace plot
##D posterior <- as.array(fit)
##D 
##D # for stanfit and stanreg objects use nuts_params() to get the divergences
##D mcmc_trace(posterior, pars = "sigma", np = nuts_params(fit))
##D 
##D color_scheme_set("viridis")
##D mcmc_trace(
##D   posterior,
##D   pars = c("wt", "sigma"),
##D   size = 0.5,
##D   facet_args = list(nrow = 2),
##D   np = nuts_params(fit),
##D   np_style = trace_style_np(div_color = "black", div_size = 0.5)
##D )
##D 
##D color_scheme_set("viridis")
##D mcmc_trace(
##D   posterior,
##D   pars = c("wt", "sigma"),
##D   size = 0.8,
##D   facet_args = list(nrow = 2),
##D   divergences = nuts_params(fit),
##D   div_color = "black"
##D )
## End(Not run)




