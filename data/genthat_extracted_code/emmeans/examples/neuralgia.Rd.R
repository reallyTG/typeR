library(emmeans)


### Name: neuralgia
### Title: Neuralgia data
### Aliases: neuralgia
### Keywords: datasets

### ** Examples

# Model and analysis shown in the SAS report:
neuralgia.glm <- glm(Pain ~ Treatment * Sex + Age, family = binomial(),
   data = neuralgia) 
pairs(emmeans(neuralgia.glm, ~ Treatment, at = list(Sex = "F")), 
    reverse = TRUE, type = "response", adjust = "bonferroni")




