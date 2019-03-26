library(ggformula)


### Name: gf_bin2d
### Title: Formula interface to geom_bin2d()
### Aliases: gf_bin2d

### ** Examples

gf_bin2d(eruptions ~ waiting, data = faithful, bins = 15) %>%
  gf_refine(scale_fill_viridis_c(begin = 0.1, end = 0.9))



