library(StratigrapheR)


### Name: in.lim
### Title: Finds the intervals encompassing values
### Aliases: in.lim

### ** Examples

x   <- c(99,1,3,5,2,4,5,6,9,4,8,20,26,52,42,24,25,12,40,10,16,17)

lim <- as.lim(l = c(100,10,20,27), r = c(99,12,27,42), b = "]]")

in.lim(x, lim = lim)

in.lim(x, lim = lim, index = TRUE)

# Applications to Stratigraphy

proxy <- proxy.example # This is a data.frame with (fake) magnetic
                       # susceptibility (ms) and depth (dt)

# Each sample was taken in a specific bed (not at the boundary between two,
# to make things easier). We will invoke the data of the beds (bed.example)
# and identify the lithology of each sample

res <- in.lim(proxy.example$dt,  # Position of each sample
              l = bed.example$l, # Left boundary of the beds
              r = bed.example$r, # Right boundary of the beds
              id = bed.example$litho) # Lithology of each bed (if you wanted
                                      # to know the name of the bed each
                                      # sample is in you would have put
                                      # bed.example$id)

proxy$litho <- res$id # The result provides the id (here the lithology) of
                      # each interval encompassing the measurement (x, here
                      # proxy.example$dt)

plot(proxy$ms, proxy$dt, type = "l", xlim = c(-2*10^-8, 8*10^-8))

shale <- subset(proxy, proxy$litho == "S")
points(shale$ms, shale$dt, pch = 4)

limestone <- subset(proxy, proxy$litho == "L")
points(limestone$ms, limestone$dt, pch = 19)

chert <- subset(proxy, proxy$litho == "C")
points(chert$ms, chert$dt, pch = 21, bg = "white")

legend(6.2*10^-8, 25, legend = c("Shale", "Limestone", "Chert"),
       pch = c(4,19,21), bg = c(NA, NA, "white"))




