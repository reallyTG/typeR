library(lmvar)


### Name: beta_sigma_names
### Title: Unique names for beta_sigma
### Aliases: beta_sigma_names

### ** Examples

# If the names in beta_sigma are all different from all of the names in
# beta_mu, the function returns the names of beta_sigma
mu_names = c("(Intercept)", "age", "gender")
sigma_names = c("(Intercept_s)", "smoker", "job_code")

beta_sigma_names(mu_names, sigma_names)

# If at least one of the names in beta_sigma is equal to a name in
# beta_mu, all the names in beta_sigma get the string '_s' appended,
# except for '(intercept_s)'
sigma_names = c("(Intercept_s)", "age", "job_code")

beta_sigma_names(mu_names, sigma_names)



