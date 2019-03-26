library(JointAI)


### Name: predDF
### Title: Create a new dataframe for prediction
### Aliases: predDF predDF.formula predDF.JointAI

### ** Examples

# fit a JointAI model
mod <- lm_imp(y~C1 + C2 + M2, data = wideDF, n.iter = 100)

# generate a dataframe with varying "C2" and reference values for all other variables in the model
newDF <- predDF(mod, var = "C2")

head(newDF)




