library(numform)


### Name: fv_percent
### Title: Convert a Numeric Vector to Percentages
### Aliases: fv_percent ffv_percent

### ** Examples

fv_percent(1:4)
fv_percent(sample(1:100, 20))
## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(tidyverse)
##D 
##D mtcars %>%
##D     count(cyl, gear) %>%
##D     group_by(cyl) %>%
##D     mutate(perc = fv_percent(n, digits = 0))
##D 
##D mtcars %>%
##D     count(cyl, gear) %>%
##D     group_by(cyl) %>%
##D     mutate(perc = fv_percent(n, digits = 0)) %>%
##D     ggplot(aes(gear, n)) +
##D         geom_bar(stat = 'identity') +
##D         facet_wrap(~cyl, ncol = 1) +
##D         geom_text(aes(y = n + 1, label = perc))
## End(Not run)



