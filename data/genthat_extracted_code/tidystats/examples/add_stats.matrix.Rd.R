library(tidystats)


### Name: add_stats.matrix
### Title: add_stats matrix function
### Aliases: add_stats.matrix

### ** Examples


# Create an empty list to store the results in
results <- list()

# Example: Confidence intervals on a regression model
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)

model_lm <- lm(weight ~ group)
model_lm_confint <- confint(model_lm)

# Add output to the results list
results <- add_stats(results, model_lm_confint, identifier = "lm_confint",
  class = "confint")




