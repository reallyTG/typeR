library(munsell)


### Name: pbgyr
### Title: Change the hue of a munsell colour
### Aliases: pbgyr

### ** Examples

my_red <- "2.5R 4/8"
pbgyr(my_red)
plot_mnsl(c(my_red, pbgyr(my_red, 2), pbgyr(my_red, 4)))



