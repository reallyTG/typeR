library(RBesT)


### Name: forest_plot
### Title: Forest Plot
### Aliases: forest_plot

### ** Examples

# we consider the example AS MAP analysis
example(AS)

# default forest plot for a gMAP analysis
forest_plot(map_AS)

# standard forest plot (only stratified estimate and Mean)
forest_plot(map_AS, est=c("Mean"), model="stratified")

# to further customize these plots, first load bayesplot and ggplot2
library(bayesplot)
library(ggplot2)

# to make plots with red colors, big fonts for presentations, suppress
# the x axis label and add another title (with a subtitle)
color_scheme_set("red")
theme_set(theme_default(base_size=16))
forest_plot(map_AS, size=2) +
   yaxis_title(FALSE) +
     ggtitle("Ankylosing Spondylitis Forest Plot",
             subtitle="Control Group Response Rate")

# the defaults are set with
color_scheme_set("blue")
theme_set(theme_default(base_size=12))




