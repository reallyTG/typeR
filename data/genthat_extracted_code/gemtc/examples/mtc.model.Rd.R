library(gemtc)


### Name: mtc.model
### Title: Generate network meta-analysis models
### Aliases: mtc.model plot.mtc.model summary.mtc.model print.mtc.model

### ** Examples

# Random effects consistency model for Parkinson network
model <- mtc.model(parkinson)
plot(model)
summary(model)

# Fixed effect meta-regression for heart failure prevention
regressor <- list(coefficient='shared',
                  variable='secondary',
                  control='control')

model <- mtc.model(hfPrevention,
                   type="regression",
                   regressor=regressor,
                   linearModel="fixed")



