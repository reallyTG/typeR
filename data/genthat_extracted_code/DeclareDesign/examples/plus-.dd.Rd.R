library(DeclareDesign)


### Name: +.dd
### Title: Add steps to create a design
### Aliases: +.dd

### ** Examples


my_population <- declare_population(N = 500, noise = rnorm(N))

my_potential_outcomes <- declare_potential_outcomes(Y ~ Z + noise)

my_sampling <- declare_sampling(n = 250)

my_assignment <- declare_assignment(m = 25)

my_estimand <- declare_estimand(ATE = mean(Y_Z_1 - Y_Z_0))

my_estimator <- declare_estimator(Y ~ Z, estimand = my_estimand)

my_mutate <- declare_step(dplyr::mutate, noise_sq = noise^2)

my_reveal <- declare_reveal()

design <- my_population + my_potential_outcomes + my_sampling +
         my_estimand + my_mutate +
         my_assignment + my_reveal + my_estimator

design

df <- draw_data(design)

estimates <- draw_estimates(design)
estimands <- draw_estimands(design)

# You can add steps to a design

design <- my_population + my_potential_outcomes
design + my_sampling

# Special Cases

# You may wish to have a design with only one step:

design <- my_population + NULL
design


## Not run: 
##D diagnosis <- diagnose_design(design)
##D 
##D summary(diagnosis)
## End(Not run)




