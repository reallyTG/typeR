library(ggforce)


### Name: facet_stereo
### Title: Create a stereogram plot
### Aliases: facet_stereo

### ** Examples

# You'll have to accept a warning about depth being an unknown aesthetic
ggplot(mtcars) +
  geom_point(aes(mpg, disp, depth = cyl)) +
  facet_stereo()



