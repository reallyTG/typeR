library(tidystats)


### Name: add_stats_to_model
### Title: Add statistical output to a model in a tidy stats list
### Aliases: add_stats_to_model

### ** Examples


# Create an empty list to store the results in
results <- list()

# Conduct a regression analysis
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)

model <- lm(weight ~ group)

# Add output to the results list
results <- add_stats(results, model, identifier = "M1")

# Get confidence intervals of the model
model_CIs <- confint(model)

# Add it to the results list
results <- add_stats_to_model(results, model_CIs, identifier = "M1",
  class = "confint")




