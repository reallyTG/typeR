library(dpcR)


### Name: adpcr2ppp
### Title: Convert adpcr to ppp
### Aliases: adpcr2ppp
### Keywords: manip panel

### ** Examples


many_panels <- sim_adpcr(m = 400, n = 765, times = 1000, pos_sums = FALSE, 
                   n_panels = 5)

# Convert all arrays to ppp objects
adpcr2ppp(many_panels)

# Convert all arrays to ppp objects and get third plate
third_plate <- adpcr2ppp(many_panels)[[3]]

# Convert only third plate to ppp object
third_plate2 <- adpcr2ppp(extract_run(many_panels, 3))

# Check the class of a new object
class(third_plate2)

# It's a list with the length 1. The third plate is a first element on this 
#list
class(third_plate2[[1]])




