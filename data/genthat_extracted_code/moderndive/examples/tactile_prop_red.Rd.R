library(moderndive)


### Name: tactile_prop_red
### Title: Tactile sampling from a tub of balls
### Aliases: tactile_prop_red
### Keywords: datasets

### ** Examples

library(ggplot2)

# Plot sampling distributions
ggplot(tactile_prop_red, aes(x = prop_red)) +
  geom_histogram(binwidth = 0.025) +
  labs(x = expression(hat(p)), y = "Number of samples", 
  title = "Sampling distribution of p_hat based 33 samples of size n = 50")



