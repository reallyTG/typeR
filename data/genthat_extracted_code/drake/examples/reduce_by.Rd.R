library(drake)


### Name: reduce_by
### Title: Reduce multiple groupings of targets
### Aliases: reduce_by

### ** Examples

plan <- drake_plan(
  data = get_data(),
  informal_look = inspect_data(data, mu = mu__),
  bayes_model = bayesian_model_fit(data, prior_mu = mu__)
)
plan <- evaluate_plan(plan, rules = list(mu__ = 1:2), trace = TRUE)
plan
reduce_by(plan, mu___from, begin = "list(", end = ")", op = ", ")
reduce_by(plan, mu__)
reduce_by(plan, mu__, append = TRUE)
reduce_by(plan, mu__, append = FALSE)
reduce_by(plan) # Reduce all the targets.
reduce_by(plan, append = FALSE)
reduce_by(plan, pairwise = FALSE)
# You can filter out the informal_look_* targets beforehand
# if you only want the bayes_model_* ones to be reduced.
# The advantage here is that if you also need `append = TRUE`,
# only the bayes_model_* targets will be reduced, but
# the informal_look_* targets will still be included
# in the output.
reduce_by(
  plan,
  mu___from,
  append = TRUE,
  filter = mu___from == "bayes_model"
)



