library(bioinactivation)


### Name: fit_isothermal_inactivation
### Title: Fit of Isothermal Experiments
### Aliases: fit_isothermal_inactivation

### ** Examples

## EXAMPLE 1 -----------

data("isothermal_inactivation")  # data set used for the example.

get_isothermal_model_data()  # retrieve valid model keys.
model_name <- "Bigelow"  # Bigelow's model will be used for the adjustment.

model_data <- get_isothermal_model_data(model_name)
model_data$params  # Get the parameters of the model

## Define the input arguments

known_params = list(temp_ref = 100)
starting_point <- c(z = 10,D_R = 1)

## Call the fitting function
iso_fit <- fit_isothermal_inactivation(model_name,
                                       isothermal_inactivation, starting_point,
                                       known_params)

## Output of the results

plot(iso_fit)

## END EXAMPLE 1 --------




