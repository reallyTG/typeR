library(ggformula)


### Name: gf_curve
### Title: Formula interface to geom_curve()
### Aliases: gf_curve

### ** Examples

D <- data.frame(x1 = 2.62, x2 = 3.57, y1 = 21.0, y2 = 15.0)
gf_point(mpg ~ wt, data = mtcars) %>%
  gf_curve(y1 + y2 ~ x1 + x2, data = D, color = "navy") %>%
  gf_segment(y1 + y2 ~ x1 + x2, data = D, color = "red")



