library(econet)


### Name: horse_race
### Title: Compare the explanatory power of parameter.dependent network
###   centrality measures with those of standard measures of network
###   centrality.
### Aliases: horse_race

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
starting <- c(alpha = 0.214094,
             beta_gender1 = -0.212706,
             beta_party1 = 0.478518,
             beta_nchair1 = 3.09234,
             beta_betweenness = 7.06287e-05,
             phi = 0.344787)

# Fit model
horse_model_B <- horse_race(formula = f_model_B,
              centralities = "betweenness",
              directed = TRUE, weighted = TRUE,
              data = db_model_B, G = G_model_B,
              model = "model_B", estimation = "NLLS",
              start.val = starting)

# Store and print results
summary(horse_model_B)
summary(horse_model_B, centrality = "betweenness")
horse_model_B$centrality
## End(No test)
# WARNING, This toy example is provided only for runtime execution.
# Please refer to previous examples for sensible calculations.
data("db_alumni_test")
data("G_model_A_test")
db_model <- db_alumni_test
G_model <- G_model_A_test
f_model <- formula("les ~ dw")
horse_model_test <- horse_race(formula = f_model, centralities = "betweenness",
                            directed = TRUE, weighted = FALSE, normalization = NULL,
                            data = db_model, unobservables = NULL, G = G_model,
                            model = "model_A", estimation = "NLLS",
                            start.val = c(alpha = -0.31055275,
                                          beta_dw = 1.50666982,
                                          beta_betweenness = 0.09666742,
                                          phi = 16.13035695))
summary(horse_model_test)



