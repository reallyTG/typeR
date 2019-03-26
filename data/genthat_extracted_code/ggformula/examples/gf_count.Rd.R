library(ggformula)


### Name: gf_count
### Title: Formula interface to geom_count()
### Aliases: gf_count

### ** Examples

# Best used in conjunction with scale_size_area which ensures that
# counts of zero would be given size 0. Doesn't make much difference
# here because the smallest count is already close to 0.

gf_count(hwy ~ cty, data = mpg, alpha = 0.5) %>%
  gf_refine(scale_size_area())




