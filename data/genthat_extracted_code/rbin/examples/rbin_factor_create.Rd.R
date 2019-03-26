library(rbin)


### Name: rbin_factor_create
### Title: Create dummy variables
### Aliases: rbin_factor_create

### ** Examples

upper <- c("secondary", "tertiary")
out <- rbin_factor_combine(mbank, education, upper, "upper")
rbin_factor_create(out, education)




