library(moderndive)


### Name: bowl_samples
### Title: Sampling from a tub of balls
### Aliases: bowl_samples
### Keywords: datasets

### ** Examples

library(dplyr)
library(ggplot2)

# Compute proportion red
bowl_samples <- bowl_samples %>%
  mutate(prop_red = red / n)
  
# Plot sampling distributions
ggplot(bowl_samples, aes(x = prop_red)) +
  geom_histogram(binwidth = 0.05) +
  labs(x = expression(hat(p)), y = "Number of samples", 
  title = "Sampling distribution of p_hat based 10 samples of size n = 50")



