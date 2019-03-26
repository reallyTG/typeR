library(rbin)


### Name: rbin_factor_combine
### Title: Combine levels
### Aliases: rbin_factor_combine

### ** Examples

upper <- c("secondary", "tertiary")
out <- rbin_factor_combine(mbank, education, upper, "upper")
table(out$education)

out <- rbin_factor_combine(mbank, education, c("secondary", "tertiary"), "upper")
table(out$education)




