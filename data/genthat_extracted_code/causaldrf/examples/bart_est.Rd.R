library(causaldrf)


### Name: bart_est
### Title: The BART estimator
### Aliases: bart_est

### ** Examples

## Example from Schafer (2015).  bart takes a few minutes to run (depending on computer).

example_data <- sim_data

## Not run: 
##D # This estimate takes a long time to run...
##D bart_list <- bart_est(Y = Y,
##D           treat = T,
##D           outcome_formula = Y ~ T + B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
##D           data = example_data,
##D           grid_val = seq(8, 16, by = 1))
##D 
##D sample_index <- sample(1:1000, 100)
##D 
##D plot(example_data$T[sample_index],
##D     example_data$Y[sample_index],
##D     xlab = "T",
##D     ylab = "Y",
##D     main = "bart estimate")
##D 
##D lines(seq(8, 16, by = 1),
##D       bart_list$param,
##D       lty = 2,
##D       lwd = 2,
##D       col = "blue")
##D 
##D legend('bottomright',
##D         "bart estimate",
##D         lty=2,
##D         lwd = 2,
##D         col = "blue",
##D         bty='Y',
##D         cex=1)
## End(Not run)

rm(example_data, bart_list, sample_index)



