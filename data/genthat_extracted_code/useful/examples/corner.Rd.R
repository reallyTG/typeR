library(useful)


### Name: corner
### Title: corner
### Aliases: corner corner.data.frame corner.matrix corner.table
###   corner.default
### Keywords: corner display head subsection tail view

### ** Examples


data(diamonds)
head(diamonds)      # displays all columns
corner(diamonds)    # displays first 5 rows and only the first 5 columns
corner(diamonds, corner="bottomleft")       # displays the last 5 rows and the first 5 columns
corner(diamonds, corner="topright")       # displays the first 5 rows and the last 5 columns




