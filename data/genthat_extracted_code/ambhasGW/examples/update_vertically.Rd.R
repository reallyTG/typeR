library(ambhasGW)


### Name: update_vertically
### Title: Update the vertical flux components
### Aliases: update_vertically

### ** Examples



# create synthetic head and parameters
h <- 10
sy <- 0.01
net.recharge <- 1
p.baseflow <- 0.7
hmin.baseflow <- 5

# update the head and compute baseflow
out <- update_vertically(h, sy, net.recharge, p.baseflow, hmin.baseflow)
out




