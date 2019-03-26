library(multcompView)


### Name: plot.multcompTs
### Title: plot multcomp graphics
### Aliases: plot.multcompTs
### Keywords: aplot

### ** Examples

##
## plot(multcompTs(...))
##
dif4 <- c(.1, .02, .03, 1)
names(dif4) <- c("A-B", "A-C", "B-C", "A-D")
(mcT4 <- multcompTs(dif4))
# Standard plot, base of "Ts" point left
mcT4.1 <- plot(mcT4, label.groups=0.05)
# Redo using "at" = list
plot(mcT4, label.groups=0.05, at=mcT4.1)
# Same plot with group labels closer to the figure
plot(mcT4, label.groups=0.02)

# Base of "Ts" point right
plot(mcT4, label.groups=TRUE, orientation="r")
# Base of "Ts" point down
plot(mcT4, horizontal=TRUE, label.groups=0.05)
# Base of "Ts" point up
plot(mcT4, horizontal=TRUE, label.groups=0.05,
     orientation="r")

# Same 4 plots but with boxes & triangles, not Ts
plot(mcT4, label.groups=0.05, type="b")
plot(mcT4, label.groups=0.05, orientation="r",
     type="b")
plot(mcT4, horizontal=TRUE, label.groups=0.05,
     type="b")
plot(mcT4, horizontal=TRUE, label.groups=0.05,
     orientation="r", type="b")

##
## plot(multcompLetters(...))
##
# ... using dif4 from above
(mcL4 <- multcompLetters(dif4, Letters=LETTERS))
# Standard plot
## Not run: 
##D # Requires (grid)
##D mcL4.1 <- plot(mcL4, label.groups=0.05)
##D # Redo using "at" = list
##D plot(mcL4, label.groups=0.05, at=mcL4.1)
##D 
##D # With bold face and larger font
##D plot(mcL4, label.groups=0.05,
##D      fontsize=28, fontface="bold")
##D 
##D # Horizontal rather than vertical
##D plot(mcL4, horizontal=TRUE, label.groups=0.05)
## End(Not run)

# Same as boxes rather than letters
plot(mcL4, label.groups=0.05, type="b")
plot(mcL4, horizontal=TRUE, label.groups=0.05,
     type="b")



