library(moderndive)


### Name: pennies
### Title: A population of 800 pennies sampled in 2011
### Aliases: pennies
### Keywords: datasets

### ** Examples

library(dplyr)
library(ggplot2)

# Take 25 different samples of size n = 50 pennies from population
many_samples <- pennies %>%
  rep_sample_n(size = 50, reps = 25)
many_samples

# Compute mean year of minting for each sample
sample_means <- many_samples %>% 
  group_by(replicate) %>% 
  summarize(mean_year = mean(year))

# Plot sampling distribution
ggplot(sample_means, aes(x = mean_year)) +
  geom_histogram(binwidth = 1, color = "white") +
  labs(x = expression(bar(x)), y = "Number of samples", 
  title = "Sampling distribution of x_bar based 25 samples of size n = 50")



