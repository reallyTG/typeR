library(fergm)


### Name: clean_summary
### Title: Clean posterior description of FERGM.
### Aliases: clean_summary
### Keywords: FERGM interpret summary

### ** Examples

## Not run: 
##D # The fergm.fit$stan.fit object is of class stanfit.
##D    # We keep it this way such that users can rely upon
##D    # conventional stan functions for interpretation
##D    # getting posterior distributions from the fergm
##D 
##D    # Conventional rstan summary call
##D 
##D  # load example data
##D data("ergm.fit")
##D data("fergm.fit")
##D data("mesa")
##D stan.smry <- summary(fergm.fit$stan.fit)$summary
##D beta_df <- stan.smry[grep("beta", rownames(stan.smry)),]
##D est <- round(beta_df[,c(1,4,8)], 3)
##D 
##D   # We have a built in function to do this simply
##D est <- clean_summary(fergm.fit)
##D est <- clean_summary(fergm.fit,
##D custom_var_names = c("Edges", "Sex Homophily", "Grade Homophily",
##D "Race Homophily", "GWESP", "Alternating K-Stars"))
## End(Not run)



