library(numform)


### Name: f_percent
### Title: Format Percentages
### Aliases: f_percent ff_percent f_prop2percent ff_prop2percent f_pp ff_pp

### ** Examples

f_percent(c(30, 33.45, .1))
f_percent(c(30, 33.45, .1), 1)
f_percent(c(0.0, 0, .2, -00.02, 1.122222, pi))
f_prop2percent(c(.30, 1, 1.01, .33, .222, .01))
f_pp(c(.30, 1, 1.01, .33, .222, .01))

f_percent(c(30, 33.45, .1), digits = 0, less.than.replace = TRUE)
f_prop2percent(c(.30, 1, 1.01, .33, .222, .01, .0001, NA), digits = 0,
    less.than.replace = TRUE)

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(ggplot2, dplyr)
##D 
##D mtcars %>%
##D     count(cyl, gear) %>%
##D     group_by(cyl) %>%
##D     mutate(prop = n/sum(n)) %>%
##D     ggplot(aes(gear, prop)) +
##D         geom_bar(stat = 'identity') +
##D         facet_wrap(~cyl, ncol = 1) +
##D         scale_y_continuous(labels = ff_prop2percent(digits = 0))
## End(Not run)



