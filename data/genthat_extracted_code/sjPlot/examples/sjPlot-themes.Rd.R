library(sjPlot)


### Name: sjPlot-themes
### Title: Modify plot appearance
### Aliases: sjPlot-themes theme_sjplot theme_sjplot2 theme_blank theme_538
###   font_size label_angle legend_style scale_color_sjplot
###   scale_fill_sjplot sjplot_pal show_sjplot_pals css_theme

### ** Examples

# prepare data
library(sjmisc)
data(efc)
efc <- to_factor(efc, c161sex, e42dep, c172code)
m <- lm(neg_c_7 ~ pos_v_4 + c12hour + e42dep + c172code, data = efc)

# create plot-object
p <- plot_model(m)

# change theme
p + theme_sjplot()

# change font-size
p + font_size(axis_title.x = 30)

# apply color theme
p + scale_color_sjplot()

# show all available colour palettes
show_sjplot_pals()

# get colour values from specific palette
sjplot_pal(pal = "breakfast club")




