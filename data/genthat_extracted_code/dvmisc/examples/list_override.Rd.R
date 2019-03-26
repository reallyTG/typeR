library(dvmisc)


### Name: list_override
### Title: Add Elements of Second List to First List, Replacing Elements
###   with Same Name
### Aliases: list_override

### ** Examples

# Create list that has default inputs to the plot function
list.defaults <- list(x = 1: 5, y = 1: 5, type = "l", lty = 1)

# Create list of user-specified inputs to the plot function
list.user <- list(main = "A Straight Line", lty = 2, lwd = 1.25)

# Combine the two lists into one, giving priority to list.user
list.combined <- list_override(list.defaults, list.user)

# Plot data using do.call
do.call(plot, list.combined)




