library(ggformula)


### Name: gf_function_2d
### Title: Plot functions of two variables
### Aliases: gf_function_2d gf_function2d gf_function_contour
###   gf_function_tile gf_fun_2d gf_fun2d gf_fun_tile gf_fun_contour

### ** Examples

theme_set(theme_bw())
gf_function_2d( fun = function(x, y) sin(2 * x * y), xlim = c(-pi, pi), ylim = c(-pi, pi)) %>%
  gf_refine(scale_fill_viridis_c())
gf_function_2d( fun = function(x, y) x + y, contour = FALSE)
gf_function_tile(fun = function(x, y) x * y) %>%
gf_function_contour(fun = function(x, y) x * y, color = "white") %>%
  gf_refine(scale_fill_viridis_c())
gf_fun_tile(x * y ~ x + y, xlim = c(-3,3), ylim = c(-2,2)) %>%
  gf_fun_contour(x * y ~ x + y, color = "white") %>%
  gf_refine(scale_fill_viridis_c()) %>%
  gf_labs(fill = "product")



