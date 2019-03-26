library(numform)


### Name: f_bin
### Title: Convert Binned Intervals to Readable Form
### Aliases: f_bin f_bin_text f_bin_text_right f_bin_right ff_bin
###   ff_bin_text ff_bin_right ff_bin_text_right f_interval f_interval_text
###   f_interval_text_right f_interval_right ff_interval ff_interval_text
###   ff_interval_text_right ff_interval_right

### ** Examples

x <- cut(-1:5, 3, right = FALSE)
y <- cut(-4:10, c(-5, 2, 6, 10), right = TRUE)
z <- cut(-4:10, c(-4, 2, 6, 11), right = FALSE)

f_bin(x)
f_interval(x) #`_interval` and `_bin` are interchangeable aliases in the function names
f_bin(y)
f_bin(z)
## HTML
f_bin(z, le = '&le;')

f_bin_text(x)
f_bin_text(y)
f_bin_text(z)
f_bin_text(x, middle = 'but')
f_bin_text(x, greater = 'Above', middle = '', equal = '', less = 'to')
f_bin_text(z, greater = 'From', middle = '', equal = '', less = 'up to')

f_bin_text_right(x)
f_bin_text_right(y)
f_bin_text_right(cut(-4:10, c(-3, 2, 6, 11)))
f_bin_text_right(x, equal.digits = TRUE)

f_bin_right(x)
f_bin_right(y)
f_bin_right(x, equal.digits = TRUE)
## HTML
f_bin_right(y, le = '&le;')

## Not run: 
##D library(tidyverse)
##D 
##D mtcars %>%
##D     mutate(mpg2 = cut(mpg, 3)) %>%
##D     ggplot(aes(disp, hp)) +
##D         geom_point() +
##D         facet_wrap(~ mpg2,
##D             labeller = ff_bin()
##D         )
##D 
##D mtcars %>%
##D     mutate(mpg2 = cut(mpg, 3)) %>%
##D     ggplot(aes(disp, hp)) +
##D         geom_point() +
##D         facet_wrap(~ mpg2,
##D             labeller = function(x) f_bin_right(x, parse = TRUE)
##D         )
##D 
##D mtcars %>%
##D     mutate(mpg2 = cut(mpg, 3, right = FALSE)) %>%
##D     ggplot(aes(disp, hp)) +
##D         geom_point() +
##D         facet_wrap(~ mpg2,
##D             labeller = function(x) f_bin_right(x, parse = TRUE)
##D         )
##D 
##D mtcars %>%
##D     mutate(mpg2 = cut(mpg, 5, right = FALSE)) %>%
##D     ggplot(aes(mpg2)) +
##D         geom_bar() +
##D         scale_x_discrete(labels = ff_bin_text_right(l = 'Up to')) +
##D         coord_flip()
##D 
##D mtcars %>%
##D     mutate(mpg2 = cut(mpg, 10, right = FALSE)) %>%
##D     ggplot(aes(mpg2)) +
##D         geom_bar(fill = '#33A1DE') +
##D         scale_x_discrete(labels = function(x) f_wrap(f_bin_text_right(x, l = 'up to'), width = 8)) +
##D         scale_y_continuous(breaks = seq(0, 14, by = 2), limits = c(0, 7)) +
##D         theme_minimal() +
##D         theme(
##D             panel.grid.major.x = element_blank(),
##D             axis.text.x = element_text(size = 14, margin = margin(t = -12)),
##D             axis.text.y = element_text(size = 14),
##D             plot.title = element_text(hjust = .5)
##D         ) +
##D         labs(title = 'Histogram', x = NULL, y = NULL)
## End(Not run)



