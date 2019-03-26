library(mkin)


### Name: mkinparplot
### Title: Function to plot the confidence intervals obtained using mkinfit
### Aliases: mkinparplot
### Keywords: hplot

### ** Examples

## Not run: 
##D model <- mkinmod(
##D   T245 = mkinsub("SFO", to = c("phenol"), sink = FALSE),
##D   phenol = mkinsub("SFO", to = c("anisole")),
##D   anisole = mkinsub("SFO"), use_of_ff = "max")
##D fit <- mkinfit(model, subset(mccall81_245T, soil == "Commerce"), quiet = TRUE)
##D mkinparplot(fit)
## End(Not run)


