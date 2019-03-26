library(sourceR)


### Name: HaldDP
### Title: Builds a HaldDP source attribution model
### Aliases: HaldDP

### ** Examples

## Not run: 
##D #### Format data using Y, X, and Prev functions #############################
##D ## Input data must be in long format
##D y <- Y(                      # Cases
##D   data = sim_SA$cases,
##D   y = "Human",
##D   type = "Type",
##D   time = "Time",
##D   location = "Location"
##D )
##D 
##D x <- X(                      # Sources
##D   data = sim_SA$sources,
##D   x = "Count",
##D   type = "Type",
##D   time = "Time",
##D   source = "Source"
##D )
##D 
##D k <- Prev(                   # Prevalences
##D   data = sim_SA$prev,
##D   prev = "Value",
##D   time = "Time",
##D   source = "Source"
##D )
##D 
##D #### Create Dirichlet(1) priors #############################################
##D 
##D ## Create alpha prior data frame
##D prior_alpha_long <- expand.grid(
##D   Source   = unique(sim_SA$sources$Source),
##D   Time     = unique(sim_SA$sources$Time),
##D   Location = unique(sim_SA$cases$Location),
##D   Alpha    = 1
##D )
##D # Use the Alpha() constructor to specify alpha prior
##D prior_alpha <- Alpha(
##D   data     = prior_alpha_long,
##D   alpha    = 'Alpha',
##D   source   = 'Source',
##D   time     = 'Time',
##D   location = 'Location'
##D )
##D 
##D ## Create r prior data frame
##D prior_r_long <- expand.grid(
##D   Type   = unique(sim_SA$sources$Type),
##D   Source = unique(sim_SA$sources$Source),
##D   Time   = unique(sim_SA$sources$Time),
##D   Value  = 0.1
##D )
##D # Use X() constructor to specify r prior
##D prior_r <- X(
##D   data   = prior_r_long,
##D   x      = 'Value',
##D   type   = 'Type',
##D   time   = 'Time',
##D   source = 'Source'
##D )
##D 
##D ## Pack all priors into a list
##D priors <- list(
##D   a_theta = 0.01,
##D   b_theta = 0.00001,
##D   a_alpha = prior_alpha,
##D   a_r     = prior_r
##D )
##D 
##D ## If all prior values are the same, they can be specified in shorthand
##D ## Equivalent result to the longform priors specified above
##D priors <- list(
##D   a_theta = 0.01,
##D   b_theta = 0.00001,
##D   a_alpha = 1,
##D   a_r     = 0.1
##D )
##D 
##D #### Set initial values (optional) ##########################################
##D types  <- unique(sim_SA$cases$Type)
##D q_long <- data.frame(q=rep(15, length(types)), Type=types)
##D init_q <- Q(q_long, q = 'q', type = 'Type')
##D inits <- list(q = init_q) # Pack starting values into a list
##D 
##D #### Construct model ########################################################
##D my_model <- HaldDP(y = y, x = x, k = k, priors = priors, inits = inits, a_q = 0.1)
##D 
##D #### Set mcmc parameters ####################################################
##D my_model$mcmc_params(n_iter = 30, burn_in = 2, thin = 1)
##D 
##D #### Update model ###########################################################
##D my_model$update()
##D ## Add an additional 10 iterations
##D my_model$update(n_iter = 10, append = TRUE)
##D 
##D #### Extract posterior ######################################################
##D ## returns the posterior for the r, alpha, q, c,
##D ## lambda_i, xi and xi_prop parameters,
##D ## for all times, locations, sources and types
##D ## the posterior is returned as a list or arrays
##D my_model$extract()
##D 
##D ## returns the posterior for the r and alpha parameters,
##D ## for time 1, location B, sources Source3, and Source4,
##D ## types 5, 25, and 50, and iterations 200:300
##D ## the posterior is returned as a list of dataframes
##D my_model$extract(params = c("r", "alpha"),
##D                  times = "1", location = "B",
##D                  sources = c("Source3", "Source4"),
##D                  types = c("5", "25", "50"),
##D                  iters = 20:30,
##D                  flatten = TRUE)
##D 
##D #### Calculate medians and credible intervals ###############################
##D my_model$summary(alpha = 0.05, CI_type = "percentiles")
##D ## subsetting is done in the same way as extract()
##D my_model$summary(alpha = 0.05, CI_type = "chen-shao",
##D                  params = c("r", "alpha"),
##D                  times = "1", location = "B",
##D                  sources = c("Source3", "Source4"),
##D                  types = c("5", "25", "50"),
##D                  iters = 20:30,
##D                  flatten = TRUE)
##D 
##D #### Plot heatmap and dendrogram of the type effect grouping ################
##D my_model$plot_heatmap()
##D 
##D #### Extract data, initial values, prior values, acceptance
##D ## rates for the mcmc algorithm and mcmc parameters
##D my_model$get_data()
##D my_model$get_inits()
##D my_model$get_priors()
##D my_model$get_acceptance()
##D my_model$get_mcmc_params()
##D 
## End(Not run)




