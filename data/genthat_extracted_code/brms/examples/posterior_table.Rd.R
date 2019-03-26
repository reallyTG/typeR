library(brms)


### Name: posterior_table
### Title: Table Creation for Posterior Samples
### Aliases: posterior_table

### ** Examples

## Not run: 
##D fit <- brm(rating ~ period + carry + treat, 
##D            data = inhaler, family = cumulative())
##D pr <- predict(fit, summary = FALSE)
##D posterior_table(pr)
## End(Not run)
 



