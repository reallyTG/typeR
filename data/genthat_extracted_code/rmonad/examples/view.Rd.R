library(rmonad)


### Name: view
### Title: Set the head of an Rmonad to a particular tag
### Aliases: view

### ** Examples

library(magrittr)
m <- 256 %v>% sqrt %>% tag('a', 'b') %v>% sqrt
esc(view(m, 'a/b'))
funnel(view(m, 'a'), m) %*>% sum



