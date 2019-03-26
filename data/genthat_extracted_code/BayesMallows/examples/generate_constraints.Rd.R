library(BayesMallows)


### Name: generate_constraints
### Title: Generate Constraint Set from Pairwise Comparisons
### Aliases: generate_constraints

### ** Examples

# Here is an example with the beach preference data.
# First, generate the transitive closure.
beach_tc <- generate_transitive_closure(beach_preferences)
# Next, generate an initial ranking.
beach_init_rank <- generate_initial_ranking(beach_tc)
# Then generate the constrain set used intervally by compute_mallows
constr <- generate_constraints(beach_tc, n_items = 15)
# Provide all this elements to compute_mallows
model_fit <- compute_mallows(rankings = beach_init_rank,
preferences = beach_tc, constraints = constr)




