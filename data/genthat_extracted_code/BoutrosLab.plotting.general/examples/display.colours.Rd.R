library(BoutrosLab.plotting.general)


### Name: display.colours
### Title: Function to display R colors, as well as corresponding R grey
###   colours.
### Aliases: display.colours display.colors
### Keywords: colour scheme grey

### ** Examples


display.colours('red');
# Red and Grey are displayed

display.colours(default.colours(5));
# Five default colours and their grey values are displayed

test.colours <- force.colour.scheme(c('skin','nerve'), 'tissue');
display.colours(test.colours);




