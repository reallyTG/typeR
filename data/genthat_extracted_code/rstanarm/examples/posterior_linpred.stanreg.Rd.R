library(rstanarm)


### Name: posterior_linpred.stanreg
### Title: Posterior distribution of the linear predictor
### Aliases: posterior_linpred.stanreg posterior_linpred

### ** Examples

if (!exists("example_model")) example(example_model)
print(family(example_model))

# linear predictor on log-odds scale
linpred <- posterior_linpred(example_model)
colMeans(linpred)

# probabilities
probs <- posterior_linpred(example_model, transform = TRUE)
colMeans(probs)

# not conditioning on any group-level parameters
probs2 <- posterior_linpred(example_model, transform = TRUE, re.form = NA)
apply(probs2, 2, median)




