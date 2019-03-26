library(tidyboot)


### Name: tidyboot.data.frame
### Title: Non-parametric bootstrap for data frames
### Aliases: tidyboot.data.frame

### ** Examples

## Mean and 95% confidence interval for 500 samples from two different normal distributions
require(dplyr)
gauss1 <- data_frame(value = rnorm(500, mean = 0, sd = 1), condition = 1)
gauss2 <- data_frame(value = rnorm(500, mean = 2, sd = 3), condition = 2)
df <- bind_rows(gauss1, gauss2)
df %>% group_by(condition) %>%
  tidyboot(summary_function = function(x) x %>% summarise(mean = mean(value)),
           statistics_functions = function(x) x %>%
           summarise_at(vars(mean), funs(ci_upper, mean, ci_lower)))



