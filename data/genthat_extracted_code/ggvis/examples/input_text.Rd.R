library(ggvis)


### Name: input_text
### Title: Create an interactive text or numeric input box.
### Aliases: input_text input_numeric

### ** Examples

fill_text <- input_text(label = "Point color", value = "red")
mtcars %>% ggvis(~wt, ~mpg, fill := fill_text) %>% layer_bars()

size_num <- input_numeric(label = "Point size", value = 25)
mtcars %>% ggvis(~wt, ~mpg, size := size_num) %>% layer_points()



