library(ggtern)


### Name: theme_convenience_functions
### Title: Theme Convenience Functions
### Aliases: theme_convenience_functions convenience_functions
###   theme_convenience

### ** Examples


#Load data and create the base plot.
plot <- ggtern() + theme_bw() + 
 theme(tern.axis.ticks.length.major=unit(3.0,'mm'),
       tern.axis.ticks.length.minor=unit(1.5,'mm'))
plot

#Show Arrows
last_plot() + theme_showarrows()

#Major/Minor Grids?
last_plot() + theme_nogrid_minor()
last_plot() + theme_nogrid_major()
last_plot() + theme_showgrid()

#Clockwise/Anticlockwise Precession
last_plot() + theme_clockwise()

#Ticks Inside or Outside
last_plot() + theme_ticksinside()

#Show/Hide BOTH Primary and Secondary Ticks
last_plot() + theme_showticks()
last_plot() + theme_hideticks()

#Show/Hide EITHER Primary OR Secondary Ticks.
last_plot() + theme_showprimary() + theme_hidesecondary()
last_plot() + theme_hideprimary() + theme_showsecondary()

#Atomic / Weight Percent
last_plot() + theme_showarrows() + atomic_percent() #+weight_percent()
last_plot() + theme_showarrows() + custom_percent("Atomic Percent")

#Rotation
last_plot() + theme_rotate(60)



