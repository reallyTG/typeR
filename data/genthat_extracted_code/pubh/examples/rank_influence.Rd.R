library(pubh)


### Name: rank_influence
### Title: Ranks observations based upon influence measures on models.
### Aliases: rank_influence

### ** Examples

data(diet, package = "Epi")
model <- glm(chd ~ fibre, data = diet, family = binomial)
rank_influence(model)



