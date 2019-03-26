library(econet)


### Name: quantify
### Title: quantify: quantification of marginal effects in linear-in-means
###   models.
### Aliases: quantify quantify.econet

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

# Fit Linear-in-means model
lim_model_B <- net_dep(formula = f_model_B, data = db_model_B,
                       G = G_model_B, model = "model_B", estimation = "NLLS",
                       hypothesis = "lim", endogeneity = TRUE, correction = "heckman",
                       first_step = "standard",
                       exclusion_restriction = G_exclusion_restriction,
                       start.val = starting)
quantify(fit = lim_model_B )
## End(No test)
# WARNING, This toy example is provided only for runtime execution.
# Please refer to previous examples for sensible calculations.
data("db_alumni_test")
data("G_model_A_test")
db_model <- db_alumni_test
G_model <- G_model_A_test
f_model <- formula("les ~ dw")
lim_model_test <- net_dep(formula = f_model, data = db_model,
                       G = G_model, model = "model_B", estimation = "NLLS",
                       hypothesis = "lim", start.val = c(alpha = 0.4553039,
                                                         beta_dw = -0.7514903,
                                                         phi = 1.6170539))
quantify(lim_model_test)



