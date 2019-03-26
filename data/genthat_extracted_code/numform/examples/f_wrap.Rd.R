library(numform)


### Name: f_wrap
### Title: Wrap Strings
### Aliases: f_wrap ff_wrap

### ** Examples

cat(f_wrap('really long label names are the pits'))
cat(f_wrap('really long label names are the pits', width = 20, exdent = 2))
f_wrap(c('really long label names are the pits and make us sad',
    'not nearly so long'), equal.lines = TRUE)

## Not run: 
##D library(tidyverse); library(gridExtra)
##D 
##D set.seed(10)
##D dat <- data_frame(
##D     level = c('Not Involved', 'Somewhat Involved Single Group',
##D         'Somewhat Involved Multiple Groups', 'Very Involved One Group',
##D         'Very Involved Multiple Groups'
##D     ),
##D     n = sample(1:10, length(level))
##D ) %>%
##D     mutate(
##D         level = factor(level, levels = unique(level)),
##D         `%` = n/sum(n)
##D     )
##D 
##D gridExtra::grid.arrange(
##D     dat %>%
##D         ggplot(aes(level, `%`)) +
##D             geom_col() +
##D             labs(title = 'Yucky Labels', y = NULL),
##D 
##D     dat %>%
##D         ggplot(aes(level, `%`)) +
##D             geom_col() +
##D             scale_x_discrete(labels = f_wrap) +
##D             scale_y_continuous(labels = ff_prop2percent(digits = 0)) +
##D             labs(title = 'Happy Labels', y = NULL),
##D 
##D     ncol = 1, heights = c(.45, .55)
##D )
##D 
## End(Not run)



