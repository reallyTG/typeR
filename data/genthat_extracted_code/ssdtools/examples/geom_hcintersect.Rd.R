library(ssdtools)


### Name: geom_hcintersect
### Title: Hazard Concentration Intersection
### Aliases: geom_hcintersect

### ** Examples

ggplot2::ggplot(boron_data, ggplot2::aes(x = Conc)) +
  geom_ssd() +
  geom_hcintersect(xintercept = 1.5, yintercept = 0.05)



