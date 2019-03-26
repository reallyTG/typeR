library(broom)


### Name: tidy.Gam
### Title: Tidy a(n) Gam object
### Aliases: tidy.Gam Gam_tidiers

### ** Examples


library(gam)
g <- gam(mpg ~ s(hp, 4) + am + qsec, data = mtcars)
  
tidy(g)
glance(g)




