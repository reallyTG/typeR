## ---- fig.align='center', fig.width=8, fig.height=5, fig.cap=paste("Figure 1: Glimpse of daily temperautres for meteorological station Ljubljana.")----
# Load the dendroTools R package
library(dendroTools)

# Load data
data(LJ_daily_temperatures)
glimpse_daily_data(env_data = LJ_daily_temperatures, tidy_env_data = FALSE, na.color = "white")


## ---- results = 'hide'---------------------------------------------------
# Load the dendroTools R package
library(dendroTools)

# Load data
data(data_MVA)
data(LJ_daily_temperatures)

# Example with fixed width
example_fixed_width <- daily_response(response = data_MVA, env_data = LJ_daily_temperatures,
                                   method = "cor", fixed_width = 60,
                                   row_names_subset = TRUE, remove_insignificant = TRUE,
                                   alpha = 0.05)


## ---- fig.align='center', fig.width=8, fig.height=5, fig.cap=paste("Figure 2: The MVA parameter contains the optimal temperature signal from March 14 (DOY 73) to May 12 (DOY 132).")----
example_fixed_width$plot_extreme

## ---- results = 'hide'---------------------------------------------------
# Load the dendroTools R package
library(dendroTools)

# Load the data
data(data_MVA)
data(LJ_daily_temperatures)

# Example for past and present
example_MVA_past <- daily_response(response = data_MVA, env_data = LJ_daily_temperatures,
                              method = "cor", lower_limit = 50, upper_limit = 70,
                              row_names_subset = TRUE, previous_year = TRUE,
                              remove_insignificant = TRUE, alpha = 0.05, 
                              plot_specific_window = 60, subset_years = c(1940, 1980))

example_MVA_present <- daily_response(response = data_MVA, env_data = LJ_daily_temperatures,
                                   method = "cor", lower_limit = 50, upper_limit = 70,
                                   row_names_subset = TRUE, previous_year = TRUE,
                                   remove_insignificant = TRUE, alpha = 0.05, 
                                   plot_specific_window = 60, subset_years = c(1981, 2010))

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 3: The temporal correlations pattern for the past")----
example_MVA_past$plot_heatmap

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 4: The temporal correlations pattern for the present")----
example_MVA_present$plot_heatmap

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 5: The temporal correlations for pre-defined window of 60 days for past years")----
example_MVA_past$plot_specific

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 6: The temporal correlations for pre-defined window of 60 days for present years")----
example_MVA_present$plot_specific

## ---- results = 'hide'---------------------------------------------------
# Load the dendroTools R package
library(dendroTools)

# Load data
data(example_proxies_individual)
data(LJ_daily_temperatures)

# Example PCA
example_PCA <- daily_response(response = example_proxies_individual, 
                              env_data = LJ_daily_temperatures, method = "lm", 
                              lower_limit = 60, upper_limit = 70,
                              row_names_subset = TRUE, remove_insignificant = TRUE,
                              alpha = 0.01, PCA_transformation = TRUE,
                              components_selection = "manual", N_components = 2)

## ------------------------------------------------------------------------
# Get the summary statistics for the PCA
summary(example_PCA$PCA_output)

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 7: The temporal pattern for the r.squared. The highest coefficients of determination were calculated for DOY around 90 with span of 2 months.")----
example_PCA$plot_heatmap

## ---- results = 'hide'---------------------------------------------------
# Load the dendroTools R package
library(dendroTools)

# Load data
data(data_TRW_1)
data(LJ_daily_temperatures)

# Example negative correlations
data(data_TRW_1)
example_neg_cor <- daily_response(response = data_TRW_1, env_data = LJ_daily_temperatures,
                              method = "cor", lower_limit = 50, upper_limit = 70,
                              row_names_subset = TRUE, remove_insignificant = TRUE,
                              alpha = 0.05)

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 8: The temporal pattern of correlation coefficients.")----
example_neg_cor$plot_heatmap

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 9: The highest calculated correlation coefficient.")----
example_neg_cor$plot_extreme

## ------------------------------------------------------------------------
# The temporal stability of correlations
example_neg_cor$temporal_stability

## ---- results = 'hide'---------------------------------------------------
# Load the dendroTools R package
library(dendroTools)

# Load data
data(data_TRW)
data(KRE_daily_temperatures)

example_reconstruction_lin <- daily_response(response = data_TRW, 
                                             env_data = KRE_daily_temperatures, 
                                             method = "lm", metric = "r.squared", 
                                             lower_limit = 30, upper_limit = 40,
                                             row_names_subset = TRUE, 
                                             temporal_stability_check = "progressive",
                                             cross_validation_type = "randomized", k = 3)

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 10: The highest calculated coefficient of determination.")----
example_reconstruction_lin$plot_extreme

## ------------------------------------------------------------------------
example_reconstruction_lin$temporal_stability
example_reconstruction_lin$cross_validation

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 11: Linear transfer function")----
example_reconstruction_lin$transfer_function

## ------------------------------------------------------------------------
linear_model <- lm(Optimized_return ~ TRW, data = example_reconstruction_lin$optimized_return)
reconstruction <- data.frame(predictions = predict(linear_model, newdata = data_TRW))

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 12: The reconstructed average temperature May 15 - June 27 with linear model")----
plot(row.names(data_TRW), reconstruction$predictions, type = "l", xlab = "Year", ylab = "Mean temperature May 15 - Jun 27 [ºC]")

## ---- results = 'hide'---------------------------------------------------
# Load the dendroTools and brnn R package
library(dendroTools)
library(brnn)

# Load data
data(data_TRW)
data(KRE_daily_temperatures)

example_reconstruction_brnn <- daily_response(response = data_TRW, 
                                              env_data = KRE_daily_temperatures, 
                                              method = "brnn", metric = "r.squared", 
                                              lower_limit = 43, upper_limit = 44,
                                              row_names_subset = TRUE, 
                                              temporal_stability_check = "progressive",
                                              cross_validation_type = "randomized", k = 3)


## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 13: The highest calculated coefficient of determination for the brnn model.")----
example_reconstruction_brnn$plot_extreme

## ------------------------------------------------------------------------
example_reconstruction_brnn$temporal_stability
example_reconstruction_brnn$cross_validation

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 14: Nonlinear brnn transfer function")----
example_reconstruction_brnn$transfer_function

## ------------------------------------------------------------------------
brnn_model <- brnn(Optimized_return ~ TRW, data = example_reconstruction_brnn$optimized_return)
reconstruction <- data.frame(predictions = predict(brnn_model, newdata = data_TRW))

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 15: The reconstructed average temperature May 15 - June 27 with the nonlinear brnn model")----
plot(row.names(data_TRW),reconstruction$predictions, type = "l", xlab = "Year",
     ylab = "Mean temperature May 15 - Jun 27 [ºC]")

## ---- results = 'hide'---------------------------------------------------
# Load the dendroTools and brnn R package
library(dendroTools)

# Load data
data(data_MVA)
data(LJ_daily_temperatures)
data(LJ_daily_precipitation)

# Example with precipitation and temperatures
example_MVA_TEMP <- daily_response(response = data_MVA, env_data = LJ_daily_temperatures,
                                   method = "cor", lower_limit = 50, upper_limit = 70,
                                   row_names_subset = TRUE, previous_year = FALSE,
                                   remove_insignificant = TRUE, alpha = 0.05, 
                                   tidy_env_data = FALSE, subset_years = c(1960, 2010))

example_MVA_PREC <- daily_response(response = data_MVA, env_data = LJ_daily_precipitation,
                                   method = "cor", lower_limit = 50, upper_limit = 70,
                                   row_names_subset = TRUE, previous_year = FALSE,
                                   remove_insignificant = TRUE, alpha = 0.05, 
                                   tidy_env_data = TRUE, subset_years = c(1960, 2010), 
                                   aggregate_function = "sum")

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=10, fig.cap=paste("Figure 16: The temporal pattern of correlatioins for temperatures (upper plot) and precipitation (lower plot)")----
library(gridExtra)
grid.arrange(example_MVA_TEMP$plot_heatmap, example_MVA_PREC$plot_heatmap)

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=10, fig.cap=paste("Figure 17: The highest calculated correlations for temperatures (upper plot) and precipitation (lower plot)")----
grid.arrange(example_MVA_TEMP$plot_extreme, example_MVA_PREC$plot_extreme)

## ------------------------------------------------------------------------
# Load the dendroTools and brnn R package
library(dendroTools)

# Example of multiproxy analysis
data(example_proxies_1)
data(LJ_daily_temperatures)

# Summary of the example_proxies_1 data frame
summary(example_proxies_1)

## ------------------------------------------------------------------------
cor(example_proxies_1)

## ---- results = 'hide'---------------------------------------------------
example_multiproxy <- daily_response(response = example_proxies_1, 
                                     env_data = LJ_daily_temperatures, 
                                     method = "lm", metric = "adj.r.squared", 
                                     lower_limit = 60, upper_limit = 70, 
                                     row_names_subset = TRUE, previous_year = FALSE, 
                                     remove_insignificant = TRUE, alpha = 0.05)

## ---- fig.align='center', warning=FALSE, fig.width=8, fig.height=5, fig.cap=paste("Figure 18: The temporal pattern of r squared for the multiproxy example)")----
example_multiproxy$plot_heatmap

## ------------------------------------------------------------------------
liner_model <- lm(Optimized_return ~ ., data = example_multiproxy$optimized_return)
summary(liner_model)

## ------------------------------------------------------------------------
example_multiproxy$transfer_function

