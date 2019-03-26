library(LEGIT)


### Name: GxE_interaction_RoS
### Title: Regions of significance using Johnson-Neyman technique
### Aliases: GxE_interaction_RoS

### ** Examples

train = example_2way(500, 1, seed=777)
ros = GxE_interaction_RoS(train$data, train$G, train$E, y ~ 1)
ros



