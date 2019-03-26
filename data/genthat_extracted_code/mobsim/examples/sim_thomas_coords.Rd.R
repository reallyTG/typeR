library(mobsim)


### Name: sim_thomas_coords
### Title: Simulate clumped spatial coordinates
### Aliases: sim_thomas_coords

### ** Examples


abund <- c(10,20,50,100)
sim1 <- sim_thomas_coords(abund, sigma = 0.02)
plot(sim1)

# Simulate species "ranges"
sim2 <- sim_thomas_coords(abund, sigma = 0.02, mother_points = 1)
plot(sim2)

# Equal numbers of points per cluster
sim3 <- sim_thomas_coords(abund, sigma = 0.02, cluster_points = 5)
plot(sim3)

# With large sigma the distribution will be essentially random (see Details)
sim4 <- sim_thomas_coords(abund, sigma = 10)
plot(sim4)




