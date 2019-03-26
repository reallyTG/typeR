library(drake)


### Name: gather_by
### Title: Gather multiple groupings of targets
### Aliases: gather_by

### ** Examples

plan <- drake_plan(
  data = get_data(),
  informal_look = inspect_data(data, mu = mu__),
  bayes_model = bayesian_model_fit(data, prior_mu = mu__)
)
plan <- evaluate_plan(plan, rules = list(mu__ = 1:2), trace = TRUE)
plan
gather_by(plan, mu___from, gather = "rbind")
gather_by(plan, mu___from, append = TRUE)
gather_by(plan, mu___from, append = FALSE)
gather_by(plan, mu__, mu___from, prefix = "x")
gather_by(plan) # Gather everything and append a row.
# You can filter out the informal_look_* targets beforehand
# if you only want the bayes_model_* ones to be gathered.
# The advantage here is that if you also need `append = TRUE`,
# only the bayes_model_* targets will be gathered, but
# the informal_look_* targets will still be included
# in the output.
gather_by(
  plan,
  mu___from,
  append = TRUE,
  filter = mu___from == "bayes_model"
)



