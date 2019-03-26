library(infer)


### Name: shade_p_value
### Title: Add information about p-value region(s)
### Aliases: shade_p_value shade_pvalue

### ** Examples

viz_plot <- mtcars %>%
  dplyr::mutate(am = factor(am)) %>%
  specify(mpg ~ am) %>% # alt: response = mpg, explanatory = am
  hypothesize(null = "independence") %>%
  generate(reps = 100, type = "permute") %>%
  calculate(stat = "t", order = c("1", "0")) %>%
  visualize(method = "both")

viz_plot + shade_p_value(1.5, direction = "right")
viz_plot + shade_p_value(1.5, direction = "both")
viz_plot + shade_p_value(1.5, direction = NULL)




