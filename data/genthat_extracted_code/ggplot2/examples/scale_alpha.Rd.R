library(ggplot2)


### Name: scale_alpha
### Title: Alpha transparency scales
### Aliases: scale_alpha scale_alpha_continuous scale_alpha_discrete
###   scale_alpha_ordinal scale_alpha_datetime scale_alpha_date

### ** Examples

p <- ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(alpha = year))

p
p + scale_alpha("cylinders")
p + scale_alpha(range = c(0.4, 0.8))



