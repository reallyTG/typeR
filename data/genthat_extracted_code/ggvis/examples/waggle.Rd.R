library(ggvis)


### Name: waggle
### Title: Waggle back and forth between two numbers
### Aliases: waggle

### ** Examples

span <- waggle(0.2, 1)
mtcars %>% ggvis(~mpg, ~wt) %>%
 layer_points() %>%
 layer_smooths(span = span)



