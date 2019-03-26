library(dotwhisker)


### Name: secret_weapon
### Title: Generate a 'Secret Weapon' Plot of Regression Results from
###   Multiple Models
### Aliases: secret_weapon

### ** Examples

library(broom)
library(dplyr)

# Estimate models across many samples, put results in a tidy data frame
by_clarity <- diamonds %>% group_by(clarity) %>%
 do(broom::tidy(lm(price ~ carat + cut + color, data = .))) %>%
 ungroup %>% rename(model = clarity)

# Generate a 'secret weapon' plot of the results of diamond size
secret_weapon(by_clarity, "carat")





