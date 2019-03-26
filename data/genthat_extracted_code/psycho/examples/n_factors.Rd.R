library(psycho)


### Name: n_factors
### Title: Find Optimal Factor Number.
### Aliases: n_factors

### ** Examples

df <- dplyr::select_if(attitude, is.numeric)
results <- psycho::n_factors(df)

summary(results)
plot(results)

# See details on methods
psycho::values(results)$methods



