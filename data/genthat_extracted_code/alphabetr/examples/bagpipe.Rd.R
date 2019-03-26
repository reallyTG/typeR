library(alphabetr)


### Name: bagpipe
### Title: Identify candidate alpha/beta pairs.
### Aliases: bagpipe

### ** Examples

 # see the help for create_clones() and create_data()
 clones <- create_clones(numb_beta = 1000,
                         dual_alpha = .3,
                         dual_beta = .06,
                         alpha_sharing = c(0.80, 0.15, 0.05),
                         beta_sharing  = c(0.75, 0.20, 0.05))
 dat <- create_data(clones$TCR, plate = 5,
                    error_drop = c(.15, .01),
                    error_seq  = c(.05, .001),
                    error_mode = c("lognormal", "lognormal"),
                    skewed = 10,
                    prop_top = 0.6,
                    dist = "linear",
                    numb_cells = matrix(c(50, 480), ncol = 2))

 ## Not run: 
##D  # normally want to set replicates to 100 or more
##D  pairs <- bagpipe(alpha = dat$alpha,
##D                beta  = dat$beta,
##D                replicates = 5,
##D                frac = 0.75,
##D                bootstrap = FALSE)
##D 
##D  # using a threshold of 0.3 of replicates
##D  pairs <- pairs[pairs[, 5] > 0.3, ]
##D  
## End(Not run)



