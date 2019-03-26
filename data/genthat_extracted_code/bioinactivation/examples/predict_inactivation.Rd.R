library(bioinactivation)


### Name: predict_inactivation
### Title: Prediction of Dynamic Inactivation
### Aliases: predict_inactivation

### ** Examples

## EXAMPLE 1 -----------

## Retrieve the model keys available for dynamic models.
get_model_data()

## Set the input arguments
example_model <- "Geeraerd"  # Geeraerd's model will be used
times <- seq(0, 5, length=100)  # values of time for output

model_data <- get_model_data(example_model)  # Retrive the data of the model used
print(model_data$parameters)
print(model_data$variables)
model_parms <- c(D_R = 1,
                 z = 10,
                 N_min = 100,
                 temp_ref = 100,
                 N0 = 100000,
                 C_c0 = 1000
                 )

## Define the temperature profile for the prediction
temperature_profile <- data.frame(time = c(0, 1.25, 2.25, 4.6),
                                  temperature = c(70, 105, 105, 70))

## Call the prediction function
prediction_results <- predict_inactivation(example_model, times,
                                           model_parms, temperature_profile)

## Show the results
head(prediction_results$simulation)
plot(prediction_results)

## END EXAMPLE 1 -----------




