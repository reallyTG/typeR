library(ggformula)


### Name: gf_contour
### Title: Formula interface to geom_contour()
### Aliases: gf_contour

### ** Examples

gf_density_2d(eruptions ~ waiting, data = faithful, alpha = 0.5, color = "navy") %>%
  gf_contour(density ~ waiting + eruptions, data = faithfuld, bins = 10, color = "red")



