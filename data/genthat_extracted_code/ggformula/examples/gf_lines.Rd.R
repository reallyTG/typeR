library(ggformula)


### Name: gf_abline
### Title: Reference lines - horizontal, vertical, and diagonal.
### Aliases: gf_abline gf_hline gf_vline gf_coefline

### ** Examples

mtcars2 <- df_stats( wt ~ cyl, data = mtcars, median_wt = median)
gf_point(wt ~ hp, size = ~ wt, color = ~ cyl, data = mtcars) %>%
  gf_abline(slope = ~ 0, intercept = ~ median_wt, color = ~ cyl, data = mtcars2)

gf_point(wt ~ hp, size = ~ wt, color = ~ cyl, data = mtcars) %>%
  gf_abline(slope = 0, intercept = 3, color = "green", data = NA)

gf_point(wt ~ hp, size = ~ wt, color = ~ cyl, data = mtcars) %>%
  gf_hline(yintercept = ~ median_wt, color = ~ cyl, data = mtcars2)

gf_point(mpg ~ hp, color = ~ cyl, size = ~ wt, data = mtcars) %>%
  gf_abline(color="red", slope = -0.10, intercept = 35)

gf_point(mpg ~ hp, color = ~ cyl, size = ~ wt, data = mtcars) %>%
  gf_abline(color = "red", slope = ~ slope, intercept = ~ intercept,
  data = data.frame(slope = -0.10, intercept = 33:35))

# We can set the color of the guidelines while mapping color in other layers
gf_point(mpg ~ hp, color = ~ cyl, size = ~ wt, data = mtcars) %>%
  gf_hline(color = "navy", yintercept = c(20, 25), data = NA) %>%
  gf_vline(color = "brown", xintercept = c(200, 300), data = NA)

# If we want to map the color of the guidelines, it must work with the
# scale of the other colors in the plot.
gf_point(mpg ~ hp, size = ~ wt, data = mtcars, alpha = 0.3) %>%
  gf_hline(color = ~ "horizontal", yintercept = ~ c(20, 25), data = NA) %>%
  gf_vline(color = ~ "vertical", xintercept = ~ c(100, 200, 300), data = NA)

gf_point(mpg ~ hp, size = ~ wt, color = ~ factor(cyl), data = mtcars, alpha = 0.3) %>%
  gf_hline(color = "orange", yintercept = 20, data = NA) %>%
  gf_vline(color = ~ c("4", "6", "8"), xintercept = ~ c(80, 120, 250), data = NA)

gf_point(mpg ~ hp, size = ~ wt, color = ~ factor(cyl), data = mtcars, alpha = 0.3) %>%
  gf_hline(color = "orange", yintercept = 20, data = NA) %>%
  gf_vline(color = c("green", "red", "blue"), xintercept = c(80, 120, 250), data = NA)

# reversing the layers requires using inherit = FALSE
gf_hline(color = "orange", yintercept = 20, data = NA) %>%
  gf_vline(color = ~ c("4", "6", "8"), xintercept = ~ c(80, 120, 250), data = NA) %>%
  gf_point(mpg ~ hp, size = ~ wt, color = ~ factor(cyl), data = mtcars, alpha = 0.3,
    inherit = FALSE)




