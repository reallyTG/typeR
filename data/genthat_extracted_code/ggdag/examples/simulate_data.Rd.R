library(ggdag)


### Name: simulate_data
### Title: Simulate Data from Structural Equation Model
### Aliases: simulate_data

### ** Examples

dagify(y ~ z, x ~ z) %>%
  tidy_dagitty() %>%
  simulate_data()



