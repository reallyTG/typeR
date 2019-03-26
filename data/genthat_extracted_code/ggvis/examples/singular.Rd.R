library(ggvis)


### Name: singular
### Title: singular.
### Aliases: singular scale_singular

### ** Examples

mtcars %>% ggvis("", ~mpg) %>%
  layer_points() %>%
  scale_nominal("x") %>%
  add_axis("x", title = "", tick_size_major = 0)

# OR
mtcars %>% ggvis("", ~mpg) %>%
  layer_points() %>%
  scale_singular("x")

# OR, even simpler
mtcars %>% ggvis(singular(), ~mpg) %>% layer_points()

# In the other direction:
mtcars %>% ggvis(~mpg, singular()) %>% layer_points()



