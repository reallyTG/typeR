library(purrr)


### Name: rerun
### Title: Re-run expressions multiple times.
### Aliases: rerun

### ** Examples

10 %>% rerun(rnorm(5))
10 %>%
  rerun(x = rnorm(5), y = rnorm(5)) %>%
  map_dbl(~ cor(.x$x, .x$y))



