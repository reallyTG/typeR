library(ggformula)


### Name: gf_dist
### Title: Plot distributions
### Aliases: gf_dist

### ** Examples

gf_dhistogram( ~ rnorm(100), bins = 20) %>%
  gf_dist("norm", color = "red")

# shading tails -- but see pdist() for this
gf_dist("norm", fill = ~(abs(x) <= 2), geom = "area")
gf_dist("norm", color = "red", kind = "cdf")
gf_dist("norm", fill = "red", kind = "histogram")
gf_dist("norm", color = "red", kind = "qqstep", resolution = 25) %>%
gf_dist("norm", color = "black", kind = "qq", resolution = 25, size = 2, alpha = 0.5)
# size is used as parameter for binomial distribution
gf_dist("binom", size = 20, prob = 0.25)
# If we want to adjust size argument for plots, we have two choices:
gf_dist("binom", size = 20, prob = 0.25, plot_size = 2)
gf_dist("binom", params = list(size = 20, prob = 0.25), size = 2)



