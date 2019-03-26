library(numform)


### Name: f_title
### Title: Convert First Letter of Words to Title Case
### Aliases: f_title ff_title

### ** Examples

f_title('i love this title')
f_title(f_replace('Cool_Variable'))

f_title(c('select', 'group by', 'My ascii'))
f_title(c('select', 'group by', 'My ascii'), upper = c('Ascii'))
f_title(c('select', 'group by', 'My ascii'), upper = c('Ascii', 'b(?=y\\b)'))

## Not run: 
##D library(tidyverse)
##D 
##D set.seed(10)
##D dat <- data_frame(
##D     level = c("not_involved", "somewhat_involved_single_group",
##D         "somewhat_involved_multiple_groups", "very_involved_one_group",
##D         "very_involved_multiple_groups"
##D     ),
##D     n = sample(1:10, length(level))
##D ) %>%
##D     mutate(
##D         level = factor(level, levels = unique(level)),
##D         `%` = n/sum(n)
##D     )
##D 
##D gridExtra::grid.arrange(
##D 
##D     gridExtra::arrangeGrob(
##D 
##D         dat %>%
##D             ggplot(aes(level, `%`)) +
##D                 geom_col() +
##D                 labs(title = 'Very Sad', y = NULL) +
##D                 theme(
##D                     axis.text = element_text(size = 7),
##D                     title = element_text(size = 9)
##D                 ),
##D 
##D        dat %>%
##D             ggplot(aes(level, `%`)) +
##D                 geom_col() +
##D                 scale_x_discrete(labels = function(x) f_replace(x, '_', '\n')) +
##D                 scale_y_continuous(labels = ff_prop2percent(digits = 0))  +
##D                 labs(title = 'Underscore Split (Readable)', y = NULL) +
##D                 theme(
##D                     axis.text = element_text(size = 7),
##D                     title = element_text(size = 9)
##D                 ),
##D 
##D 
##D         ncol = 2
##D 
##D     ),
##D     gridExtra::arrangeGrob(
##D 
##D        dat %>%
##D             ggplot(aes(level, `%`)) +
##D                 geom_col() +
##D                 scale_x_discrete(labels = function(x) f_title(f_replace(x))) +
##D                 scale_y_continuous(labels = ff_prop2percent(digits = 0))  +
##D                 labs(title = 'Underscore Replaced & Title (Capitalized Sadness)', y = NULL) +
##D                 theme(
##D                     axis.text = element_text(size = 7),
##D                     title = element_text(size = 9)
##D                 ),
##D 
##D         dat %>%
##D             ggplot(aes(level, `%`)) +
##D                 geom_col() +
##D                 scale_x_discrete(labels = function(x) f_wrap(f_title(f_replace(x)))) +
##D                 scale_y_continuous(labels = ff_prop2percent(digits = 0))  +
##D                 labs(title = 'Underscore Replaced, Title, & Wrapped (Happy)', y = NULL) +
##D                 theme(
##D                     axis.text = element_text(size = 7),
##D                     title = element_text(size = 9)
##D                 ),
##D 
##D         ncol = 2
##D 
##D     ), ncol = 1
##D 
##D )
##D 
## End(Not run)



