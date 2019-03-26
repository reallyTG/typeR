library(fastR2)


### Name: Spheres
### Title: Measuring spheres
### Aliases: Spheres
### Keywords: datasets

### ** Examples

data(Spheres)
gf_point(mass ~ diameter, data = Spheres)
gf_point(mass ~ diameter, data = Spheres) %>%
  gf_refine(scale_x_log10(), scale_y_log10())



