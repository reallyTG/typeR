library(StratigrapheR)


### Name: multigons
### Title: Draws several polygons
### Aliases: multigons

### ** Examples

# Simple use:

i <- c(rep("A1",6), rep("A2",6), rep("A3",6)) # Polygon ids
x <- c(1,2,3,3,2,1,2,3,4,4,3,2,3,4,5,5,4,3)   # x coordinates
y <- c(1,2,3,4,5,6,1,2,3,4,5,6,1,2,3,4,5,6)   # y coordinates

plot(c(-1,7), c(-2,9), type = "n", xlab = "", ylab = "", main = "Simple use")

multigons(i, x, y,
          front = "A2", # This gets the polygon A2 in front of all others
          density = c(NA, 5, 10),  # Different shading density
          scol = "darkred", # Same shading colour
          col = c("black", "grey", "white"), # Different background colour
          lwd = 2, # Width of border lines for all polygons
          slty = 2, # Shading lines type, same for all polygons
          slwd = 1) # Shading lines width, same for all polygons

# Advanced use:
# Lets first create more polygons

i2 <- c(i, rep("A4",6), rep("A5",6), rep("A6",6))
x2 <- rep(x,2)
y2 <- c(y, y - 4)

# Then lets attribute a group to each of them: lets say blue and red polygons

groups <- data.frame(j = c("A1", "A2", "A3", "A4", "A5","A6"),
                      group = c("blue", "red", "blue", "red", "red", "blue"),
                      stringsAsFactors = FALSE)

# Then lets attribute different graphical parameters for each group

legend <- data.frame(group = c("red", "blue"),
                     col = c("red", "blue"),
                     density = c(10,20),
                     scol = c("darkred", "darkblue"),
                      stringsAsFactors = FALSE)

 # Now that you have a data frame saying which polygon is in which group,
 # and one providing distinct graphical parameters for each group, you can
 # join the two with help of the dplyr package:

 library(dplyr)

 parameters <- left_join(groups, legend, by = "group")

 # Then simply apply them to multigons:

 plot(c(0,12), c(-3,7), type = "n", xlab = "", ylab = "",
      main = "Advanced use")

 multigons(i2,x2,y2,
           forget = c("A1"),     # If you want to avoid drawing one polygon
           front = c("A2","A3"), # Puts A2 in front and A3 right behind
           col = parameters$col,
           density = parameters$density,
           scol = parameters$scol,
           lwd = 2)

# Another way (more advanced, but with interesting programming applications)
# to code this:

all.parameters <- merge_list(list(i = i2, x = x2 + 6, y = y2),
                             as.list(parameters),
                             list(lwd = 3, slwd = 2, slty = 2))

all.parameters <- all.parameters[!names(all.parameters) == "group"]

do.call(multigons, all.parameters)




