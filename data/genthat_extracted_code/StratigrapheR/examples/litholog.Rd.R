library(StratigrapheR)


### Name: litholog
### Title: Creates a litholog
### Aliases: litholog

### ** Examples

l <- c(1,2,3)  # left boundary of the bed interval (upper or lower)
r <- c(0,1,2)  # right boundary of the bed interval (upper or lower)
h  <- c(4,3,4) # hardness (arbitrary)
i   <- c("B1","B2","B3") # Bed name

basic.litholog <- litholog(l,r,h,i) # Generate data frame of the polygons
                                    # making the litholog

whiteSet(xlim = c(0,4), ylim = c(0,3), ytick = 1, ny = 10) # Plot background
multigons(basic.litholog$i, basic.litholog$xy, basic.litholog$dt) # Draw log




