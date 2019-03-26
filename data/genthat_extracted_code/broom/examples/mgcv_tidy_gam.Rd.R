library(broom)


### Name: tidy.gam
### Title: Tidy a(n) gam object
### Aliases: tidy.gam mgcv_tidiers gam_tidiers

### ** Examples


g <- mgcv::gam(mpg ~ s(hp) + am + qsec, data = mtcars)
  
tidy(g)
tidy(g, parametric = TRUE)
glance(g)





