library(infer)


### Name: shade_confidence_interval
### Title: Add information about confidence interval
### Aliases: shade_confidence_interval shade_ci

### ** Examples

viz_plot <- mtcars %>%
  dplyr::mutate(am = factor(am)) %>%
  specify(mpg ~ am) %>% # alt: response = mpg, explanatory = am
  hypothesize(null = "independence") %>%
  generate(reps = 100, type = "permute") %>%
  calculate(stat = "t", order = c("1", "0")) %>%
  visualize(method = "both")

viz_plot + shade_confidence_interval(c(-1.5, 1.5))
viz_plot + shade_confidence_interval(c(-1.5, 1.5), fill = NULL)




