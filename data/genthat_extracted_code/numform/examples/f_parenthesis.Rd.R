library(numform)


### Name: f_parenthesis
### Title: Parenthesis Formatting of Two Vectors
### Aliases: f_parenthesis ff_parenthesis f_mean_sd ff_mean_sd
###   f_num_percent ff_num_percent

### ** Examples

f_parenthesis(
    f_num(sample(50:100, 5), 1),
    f_num(rnorm(5, 5:15, 5), 1),
    prefix = 'mean = ',
    parenthesis_prefix = 'sd = ',
    sep = " "
)

f_mean_sd(rnorm(5, 100, 20), rnorm(5, 20, 5))

f_num_percent(rnorm(5, 100, 20), rnorm(5, .5, .1))

f_parenthesis(
    sample(50:100, 5),
    f_prop2percent(rnorm(5, .5, .1), 0)
)

 ## Not run: 
##D library(tidyverse)
##D mtcars %>%
##D     group_by(cyl) %>%
##D     summarize(
##D         mean = mean(hp),
##D         sd = sd(hp),
##D         n = n()
##D     ) %>%
##D     mutate(
##D         prop = n /sum(n),
##D         mean_sd = f_mean_sd(mean, sd),
##D         n_perc = f_num_percent(n, prop, 0)
##D     )
## End(Not run)



