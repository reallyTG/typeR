library(numform)


### Name: f_affirm
### Title: Yes/No Convert Logical/Dummy Code
### Aliases: f_affirm ff_affirm

### ** Examples

f_affirm(c(TRUE, TRUE, FALSE))
f_affirm(c(1, 1, 0, 1, 0, 0, NA))
f_affirm(c(1, 0, 2, .3, -3))
f_affirm(rnorm(20) > 0)
f_affirm(rnorm(20) > 0, "A", "B")

## Not run: 
##D library(ggplot2)
##D library(dplyr)
##D 
##D ## Without labels
##D data_frame(dummy = sample(c(TRUE, FALSE), 30, TRUE)) %>%
##D     count(dummy) %>%
##D     ggplot(aes(dummy, n)) +
##D         geom_bar(stat = 'identity')
##D 
##D ## With labels
##D data_frame(dummy = sample(c(TRUE, FALSE), 30, TRUE)) %>%
##D     count(dummy) %>%
##D     ggplot(aes(dummy, n)) +
##D         geom_bar(stat = 'identity') +
##D         scale_x_discrete(labels = f_affirm)
## End(Not run)



