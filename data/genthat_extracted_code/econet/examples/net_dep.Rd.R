library(econet)


### Name: net_dep
### Title: Implement a number of modifications to the linear-in-means model
###   to obtain different weighted versions of Katz-Bonacich centrality.
### Aliases: net_dep

### ** Examples

## No test: 
# Model A

# Load data
data("a_db_alumni")
data("a_G_alumni_111")
db_model_A <- a_db_alumni
G_model_A <- a_G_alumni_111
are_factors <- c("party", "gender", "nchair", "isolate")
db_model_A[are_factors] <- lapply(db_model_A[are_factors] ,factor)
db_model_A$PAC <- db_model_A$PAC/1e+06

# Specify formula
f_model_A <- formula("PAC ~ gender + party + nchair + isolate")

# Specify starting values
starting <- c(alpha = 0.47325,
              beta_gender1 = -0.26991,
              beta_party1 = 0.55883,
              beta_nchair1 = -0.17409,
              beta_isolate1 = 0.18813,
              phi = 0.21440)

# Fit Linear-in-means model
lim_model_A <- net_dep(formula = f_model_A, data = db_model_A,
                       G = G_model_A, model = "model_A", estimation = "NLLS",
                       hypothesis = "lim", start.val = starting)

summary(lim_model_A)
lim_model_A$centrality

# Test Heterogeneity

# Heterogeneous factor
z <- as.numeric(as.character(db_model_A$gender))

# Specify formula
f_het_model_A <- formula("PAC ~ party + nchair + isolate")

# Specify starting values
starting <- c(alpha = 0.44835,
              beta_party1 = 0.56004,
              beta_nchair1 = -0.16349,
              beta_isolate1 = 0.21011,
              beta_z = -0.26015,
              phi = 0.34212,
              gamma = -0.49960)

# Fit model
het_model_A <- net_dep(formula = f_het_model_A, data = db_model_A,
                       G = G_model_A, model = "model_A", estimation = "NLLS",
                       hypothesis = "het", z = z, start.val = starting)

summary(het_model_A)
het_model_A$centrality

# Model B

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
                       hypothesis = "lim", endogeneity = TRUE,
                       correction = "heckman", first_step = "standard",
                       exclusion_restriction = G_exclusion_restriction,
                       start.val = starting)

summary(lim_model_B)
lim_model_B$centrality
summary(lim_model_B, print = "first.step")

# Test Heterogeneity

# Heterogeneous factor (node -level)
z <- as.numeric(as.character(db_model_B$gender))

# Specify formula
f_het_model_B <- formula("les ~ party + nchair")

# Specify starting values
starting <- c(alpha = 0.23952,
              beta_party1 = 0.42947,
              beta_nchair1 = 3.09615,
              beta_z = -0.12749,
              theta_0 = 0.42588,
              theta_1 = 0.08007)

# Fit model
het_model_B_l <- net_dep(formula = f_het_model_B,
                         data = db_model_B,
                         G = G_model_B, model = "model_B", estimation = "NLLS",
                         hypothesis = "het_l", z = z, start.val = starting)

# Store and print results
summary(het_model_B_l)
het_model_B_l$centrality

# Specify starting values
starting <- c(alpha = 0.04717,
              beta_party1 = 0.51713,
              beta_nchair1 = 3.12683,
              beta_z = 0.01975,
              eta_0 = 1.02789,
              eta_1 = 2.71825)

# Fit model
het_model_B_r <- net_dep(formula = f_het_model_B,
                         data = db_model_B,
                         G = G_model_B, model = "model_B", estimation = "NLLS",
                         hypothesis = "het_r", z = z, start.val = starting)

# Store and print results
summary(het_model_B_r)
het_model_B_r$centrality

# Heterogeneous factor (edge -level)
z <- as.numeric(as.character(db_model_B$party))

# Specify starting values
starting <- c(alpha = 0.242486,
              beta_gender1 = -0.229895,
              beta_party1 = 0.42848,
              beta_nchair1 = 3.0959,
              phi_within  = 0.396371,
              phi_between = 0.414135)

# Fit model
party_model_B <- net_dep(formula = f_model_B, data = db_model_B,
                         G = G_model_B, model = "model_B",
                         estimation = "NLLS", hypothesis = "par",
                         z = z, start.val = starting)

# Store and print results
summary(party_estimate_model_B)
party_estimate_model_B$centrality
## End(No test)
# WARNING, This toy example is provided only for runtime execution.
# Please refer to previous examples for sensible calculations.
data("db_alumni_test")
data("G_model_A_test")
db_model_A <- db_alumni_test
G_model_A <- G_model_A_test
f_model_A <- formula("les ~ dw")
lim_model_A_test <- net_dep(formula = f_model_A, data = db_model_A,
                       G = G_model_A, model = "model_A", estimation = "NLLS",
                       hypothesis = "lim", start.val = c(alpha = 0.09030594,
                                                         beta_dw = 1.21401940,
                                                         phi = 1.47140647))
summary(lim_model_A_test)



