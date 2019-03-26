library(ggvis)


### Name: print.ggvis
### Title: View in a ggvis plot in the browser.
### Aliases: print.ggvis view_static view_dynamic
### Keywords: internal

### ** Examples

# In most cases view_static is unnecessary; these will do the same thing:
mtcars %>% ggvis(~wt, ~mpg)
mtcars %>% ggvis(~wt, ~mpg) %>% view_static()

# Can find the output file with view_static() and html_print()
outfile <- mtcars %>% ggvis(~wt, ~mpg) %>%
  view_static() %>% htmltools::html_print(viewer = NULL)



