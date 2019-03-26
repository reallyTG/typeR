library(bamdit)


### Name: plot.metadiag
### Title: Generic plot function for metadiag object in bamdit
### Aliases: plot.metadiag

### ** Examples




## Not run: 
##D library(bamdit)
##D data("glas")
##D glas.t <- glas[glas$marker == "Telomerase", 1:4]
##D glas.m1 <- metadiag(glas.t,                # Data frame
##D                     re = "normal",         # Random effects distribution
##D                     re.model = "DS",       # Random effects on D and S
##D                     link = "logit",        # Link function
##D                     sd.Fisher.rho   = 1.7, # Prior standard deviation of correlation
##D                     nr.burnin = 1000,      # Iterations for burnin
##D                     nr.iterations = 10000, # Total iterations
##D                     nr.chains = 2,         # Number of chains
##D                     r2jags = TRUE)         # Use r2jags as interface to jags
##D 
##D 
##D  plot(glas.m1,                    # Fitted model
##D       level = c(0.5, 0.75, 0.95), # Credibility levels
##D       parametric.smooth = TRUE)   # Parametric curve
##D 
##D # Plot results: based on a non-parametric smoother of the posterior predictive rates .......
##D 
##D plot(glas.m1,                    # Fitted model
##D      level = c(0.5, 0.75, 0.95), # Credibility levels
##D      parametric.smooth = FALSE)  # Non-parametric curve
##D 
##D # Using the pipe command in the package dplyr and changing some colors .......
##D 
##D library(dplyr)
##D 
##D glas.t %>%
##D  metadiag(re = "normal", re.model ="SeSp") %>%
##D    plot(parametric.smooth = FALSE,
##D           S = 100,
##D           color.data.points = "green",
##D           color.pred.points = "blue",
##D           color.line = "black")
##D 
## End(Not run)



