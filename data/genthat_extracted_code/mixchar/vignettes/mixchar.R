## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  my_data <- read.csv('your_file_path_here.csv', header = FALSE, skip = 15)
#  colnames(c('temperature_C', 'mass_mg'))

## ------------------------------------------------------------------------
library(mixchar)
head(juncus)

## ------------------------------------------------------------------------
deriv_juncus <- process(juncus,                          # dataframe name
                        init_mass = 18.96,
                        temp = 'temp_C',                 # column name for temperature
                        mass_loss = 'mass_loss')         # column name for mass loss data
deriv_juncus

## ------------------------------------------------------------------------
deriv_marsilea <- process(marsilea, 
                          init_mass = 15.29,
                          temp = 'temp_C', 
                          mass_loss = 'mass_loss')
deriv_marsilea

## ---- fig.height = 3.7---------------------------------------------------
plot(deriv_juncus, cex = 0.9)

## ---- fig.height = 3.7---------------------------------------------------
plot(deriv_marsilea, cex = 0.9)

## ------------------------------------------------------------------------
output_juncus <- deconvolve(deriv_juncus)
output_juncus

## ------------------------------------------------------------------------
# here's an example of specifying your starting vector. 
# the order of values is height, skew, position, then width

my_starting_vec <- c(height_0 = 0.002, skew_0 = -0.15, position_0 = 210, width_0 = 50,
                     height_1 = 0.003, skew_1 = -0.15, position_1 = 250, width_1 = 50,
                     height_2 = 0.006, skew_2 = -0.15, position_2 = 320, width_2 = 30,
                     height_3 = 0.001, skew_3 = -0.15, position_3 = 390, width_3 = 200)

output_marsilea <- deconvolve(deriv_marsilea, n_peaks = 4, start_vec = my_starting_vec)

output_marsilea

## ------------------------------------------------------------------------
juncus_rate <- rate_data(output_juncus)
head(juncus_rate)

## ------------------------------------------------------------------------
temp_bounds(output_juncus)

## ------------------------------------------------------------------------
model_fit(output_juncus)

## ------------------------------------------------------------------------
model_fit(output_marsilea)

## ------------------------------------------------------------------------
component_weights(output_juncus)

## ------------------------------------------------------------------------
component_weights(output_marsilea)

## ---- out.width = '80%'--------------------------------------------------
plot(output_juncus, bw = FALSE)

## ---- out.width = '80%'--------------------------------------------------
plot(output_marsilea, bw = FALSE)

## ------------------------------------------------------------------------
juncus_parameters <- model_parameters(output_juncus)

