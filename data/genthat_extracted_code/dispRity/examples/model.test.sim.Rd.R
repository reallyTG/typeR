library(dispRity)


### Name: model.test.sim
### Title: Simulate Model Test
### Aliases: model.test.sim

### ** Examples

## Disparity through time data
data(BeckLee_disparity)

## List of models to test
models <- list("Trend", "BM")

## Testing the models on the observed disparity
model_test_output <- model.test(BeckLee_disparity, models, time.split = 66)
 
## simulations using the output from model.test
model_test_sim_output <- model.test.sim(sim = 1000, model= model_test_output)
 
## Plot the simulated best model
plot(model_test_sim_output)
## Add the observed data
plot(BeckLee_disparity, add = TRUE, col = c("pink", "#ff000050", "#ff000050"))

## Simulating a specific model with specific parameters parameters
model_simulation <- model.test.sim(sim = 1000, model = "BM", time.span = 120, variance = 0.1,
                                   sample.size = 100, parameters = list(ancestral.state = 0,
                                   sigma.squared = 0.1))

## Summarising the results
plot(model_simulation, main = "A simple Brownian motion")




