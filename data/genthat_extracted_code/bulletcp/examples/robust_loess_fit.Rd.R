library(bulletcp)


### Name: robust_loess_fit
### Title: Fit a robust loess regression
### Aliases: robust_loess_fit

### ** Examples

data("example_data")
head(raw_data)
raw_data <- raw_data[seq(from = 1, to = nrow(raw_data), by = 30),]
plot(raw_data$x, raw_data$y)

# set the minimum y-value to zero
check_min <- min(raw_data$value[!is.na(raw_data$value)])
raw_data <- dplyr::mutate(raw_data, value_std = value - check_min)

# remove global structure
rlo_fit <- robust_loess_fit(cc = raw_data, iter = 20)
raw_data$rlo_pred <- predict(rlo_fit, newdata = raw_data)
raw_data$rlo_resid <- raw_data$value_std - raw_data$rlo_pred

# define new data frame without the global structure
data <- data.frame("x" = raw_data$x, "y" = raw_data$rlo_resid)
plot(data$x, data$y)



