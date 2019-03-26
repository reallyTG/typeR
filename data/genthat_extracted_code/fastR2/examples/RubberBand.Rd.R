library(fastR2)


### Name: RubberBand
### Title: Rubber band launching - unfinished documentation
### Aliases: RubberBand
### Keywords: datasets

### ** Examples


data(RubberBand)
gf_point(distance ~ stretch, data = RubberBand) %>%
  gf_lm(interval = "confidence")




