library(bang)


### Name: summary.hef
### Title: Summarizing hef objects
### Aliases: summary.hef

### ** Examples

# Beta-binomial model, rat data
rat_res <- hef(model = "beta_binom", data = rat)

# Posterior summaries of the hyperparameters alpha and beta
summary(rat_res)

# Posterior summaries of the binomial probability for rats 1 to 3
summary(rat_res, params = "pop", which_pop = 1:3)



