library(ggforce)


### Name: scale_depth
### Title: Scales for depth perception
### Aliases: scale_depth scale_depth_continuous scale_depth_discrete

### ** Examples

ggplot(mtcars) +
  geom_point(aes(mpg, disp, depth = cyl)) +
  scale_depth(range = c(-0.1, 0.25)) +
  facet_stereo()



