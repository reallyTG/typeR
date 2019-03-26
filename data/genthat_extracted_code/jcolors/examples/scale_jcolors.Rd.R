library(jcolors)


### Name: scale_color_jcolors_contin
### Title: continuous jcolors color scales
### Aliases: scale_color_jcolors_contin scale_colour_jcolors_contin
###   scale_fill_jcolors_contin scale_color_jcolors scale_colour_jcolors
###   scale_fill_jcolors

### ** Examples

library(ggplot2)

plt <- ggplot(data.frame(x = rnorm(10000), y = rexp(10000, 1.5)), aes(x = x, y = y)) +
   geom_hex() + coord_fixed()

plt + scale_fill_jcolors_contin() + theme_bw()

plt + scale_fill_jcolors_contin("pal2", bias = 1.5) + theme_bw()

plt + scale_fill_jcolors_contin("pal3") + theme_bw()


library(ggplot2)
data(morley)

pltl <- ggplot(data = morley, aes(x = Run, y = Speed,
group = factor(Expt),
colour = factor(Expt))) +
    geom_line(size = 2) +
    theme_bw() +
    theme(panel.background = element_rect(fill = "grey97"),
          panel.border = element_blank())

pltd <- ggplot(data = morley, aes(x = Run, y = Speed,
group = factor(Expt),
colour = factor(Expt))) +
    geom_line(size = 2) +
    theme_bw() +
    theme(panel.background = element_rect(fill = "grey15"),
          panel.border = element_blank(),
          panel.grid.major = element_line(color = "grey45"),
          panel.grid.minor = element_line(color = "grey25"))

pltl + scale_color_jcolors(palette = "default")

pltd + scale_color_jcolors(palette = "default")





