library(ggvis)


### Name: layer_guess
### Title: Guess the right type of layer based on current properties.
### Aliases: layer_guess

### ** Examples

# A scatterplot:
mtcars %>% ggvis(~mpg, ~wt)
mtcars %>% ggvis(~mpg, ~wt) %>% layer_guess()

# A histogram:
mtcars %>% ggvis(~mpg)
mtcars %>% ggvis(~mpg) %>% layer_guess()



