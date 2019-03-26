library(statsr)


### Name: inference
### Title: Hypothesis tests and confidence intervals
### Aliases: inference

### ** Examples

data(tapwater)

# Calculate 95% CI using quantiles using a Student t distribution
inference(tthm, data=tapwater,
                statistic="mean", 
                type="ci",
                method="theoretical")
                
inference(tthm, data=tapwater,
                statistic="mean", 
                type="ci",
                boot_method = "perc",
                method="simulation")
                
# Inference for a proportion
# Calculate 95% confidence intervals for the proportion of atheists

data("atheism")
library("dplyr")
us12 <- atheism %>%
        filter(nationality == "United States" , atheism$year == "2012")
inference(y = response, data = us12, statistic = "proportion",
          type = "ci",
          method = "theoretical", 
          success = "atheist")
                



