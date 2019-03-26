library(Momocs)


### Name: coo_slidedirection
### Title: Slides coordinates in a particular direction
### Aliases: coo_slidedirection

### ** Examples

b <- coo_rotate(bot[1], pi/6) # dummy example just to make it obvious
coo_plot(b) # not the first point
coo_plot(coo_slidedirection(b, "up"))
coo_plot(coo_slidedirection(b, "right"))
coo_plot(coo_slidedirection(b, "left"))
coo_plot(coo_slidedirection(b, "down"))

# on Coo objects
stack(bot)
stack(coo_slidedirection(bot, "left"))




