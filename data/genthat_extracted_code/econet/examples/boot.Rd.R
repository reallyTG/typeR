library(econet)


### Name: boot
### Title: boot: Bootstrap residuals with cross-sectional dependence
### Aliases: boot boot.econet

### ** Examples

## No test: 
# Load data
data("db_cosponsor")
data("G_alumni_111")
db_model_B <- db_cosponsor
G_model_B <- G_cosponsor_111
G_exclusion_restriction <- G_alumni_111
are_factors <- c("party", "gender", "nchair")
db_model_B[are_factors] <- lapply(db_model_B[are_factors], factor)

# Specify formula
f_model_B <- formula("les ~gender + party + nchair")

# Specify starting values
starting <- c(alpha = 0.23952,
              beta_gender1 = -0.22024,
              beta_party1 = 0.42947,
              beta_nchair1 = 3.09615,
              phi = 0.40038,
              unobservables = 0.07714)

# object Linear-in-means model
lim_model_B <- net_dep(formula = f_model_B, data = db_model_B,
                       G = G_model_B, model = "model_B", estimation = "NLLS",
                       hypothesis = "lim", endogeneity = TRUE, correction = "heckman",
                       first_step = "standard",
                       exclusion_restriction = G_exclusion_restriction,
                       start.val = starting)
# Bootstrap
# Warning: this may take a very long time to run.
# Decrease the number of iterations to reduce runtime.
boot_lim_estimate <- boot(object = lim_model_B, hypothesis = "lim",
                          group = NULL, niter = 1000, weights = FALSE)
boot_lim_estimate
## End(No test)



