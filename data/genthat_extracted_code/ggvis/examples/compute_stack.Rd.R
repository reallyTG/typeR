library(ggvis)


### Name: compute_stack
### Title: Stack overlapping data.
### Aliases: compute_stack

### ** Examples

mtcars %>% cbind(count = 1) %>% compute_stack(~count, ~cyl)

# Shouldn't use or affect existing grouping
mtcars %>% cbind(count = 1) %>% group_by(am) %>% compute_stack(~count, ~cyl)

# If given a ggvis object, will use x variable for stacking by default
mtcars %>% ggvis(x = ~cyl, y = ~wt) %>%
  compute_stack(stack_var = ~wt, group_var = ~cyl) %>%
  layer_rects(x = ~cyl - 0.5, x2 = ~cyl + 0.5, y = ~stack_upr_,
    y2 = ~stack_lwr_)

# Collapse across hair & eye colour data across sex
hec <- as.data.frame(xtabs(Freq ~ Hair + Eye, HairEyeColor))
hec %>% compute_stack(~Freq, ~Hair)

# Without stacking - bars overlap
hec %>% ggvis(~Hair, ~Freq, fill = ~Eye, fillOpacity := 0.5) %>%
  layer_rects(y2 = 0, width = band())

# With stacking
hec %>% ggvis(x = ~Hair, y = ~Freq, fill = ~Eye, fillOpacity := 0.5) %>%
  compute_stack(~Freq, ~Hair) %>%
  layer_rects(y = ~stack_lwr_, y2 = ~stack_upr_, width = band())

# layer_bars stacks automatically:
hec %>% ggvis(~Hair, ~Freq, fill = ~Eye, fillOpacity := 0.5) %>%
  group_by(Eye) %>%
  layer_bars(width = 1)



