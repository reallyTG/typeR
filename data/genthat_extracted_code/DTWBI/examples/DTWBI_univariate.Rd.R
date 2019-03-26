library(DTWBI)


### Name: DTWBI_univariate
### Title: DTWBI algorithm for univariate signals
### Aliases: DTWBI_univariate

### ** Examples

data(dataDTWBI)
X <- dataDTWBI[, 1]

rate <- 0.1
output <- gapCreation(X, rate)
data <- output$output_vector
gap_begin <- output$begin_gap
gap_size <- output$gap_size
imputed_data <- DTWBI_univariate(data, t_gap=gap_begin, T_gap=gap_size)
plot(imputed_data$input_vector, type = "l", lwd = 2) # Uncomplete signal
lines(imputed_data$output_vector, col = "red") # Imputed signal
lines(y = imputed_data$query,
      x = imputed_data$pos_query[1]:imputed_data$pos_query[2],
      col = "green", lwd = 4) # Query
lines(y = imputed_data$sim_window,
      x = imputed_data$pos_sim_window[1]:imputed_data$pos_sim_window[2],
      col = "orange", lwd = 4) # Similar sequence to the query
lines(y = imputed_data$imputation_window,
      x = imputed_data$pos_imp_window[1]:imputed_data$pos_imp_window[2],
      col = "blue", lwd = 4) # Imputing proposal



