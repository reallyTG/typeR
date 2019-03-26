library(interactions)


### Name: johnson_neyman
### Title: Calculate Johnson-Neyman intervals for 2-way interactions
### Aliases: johnson_neyman

### ** Examples

# Using a fitted lm model
states <- as.data.frame(state.x77)
states$HSGrad <- states$`HS Grad`
fit <- lm(Income ~ HSGrad + Murder*Illiteracy,
  data = states)
johnson_neyman(model = fit, pred = Murder,
  modx = Illiteracy)




