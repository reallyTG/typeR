library(moderndive)


### Name: pennies_sample
### Title: A random sample of 40 pennies sampled from the 'pennies' data
###   frame
### Aliases: pennies_sample
### Keywords: datasets

### ** Examples

library(dplyr)
library(ggplot2)

# Take 50 different resamples/bootstraps from the original sample
many_bootstraps <- pennies_sample %>%
  rep_sample_n(size = 40, replace = TRUE, reps = 50)
many_bootstraps

# Compute mean year of minting for each bootstrap sample
bootstrap_means <- many_bootstraps %>% 
  group_by(replicate) %>% 
  summarize(mean_year = mean(year))

# Plot sampling distribution
ggplot(bootstrap_means, aes(x = mean_year)) +
  geom_histogram(binwidth = 1, color = "white") +
  labs(x = expression(bar(x)), y = "Number of samples", 
  title = "Bootstrap distribution of x_bar based 50 resamples of size n = 40")



