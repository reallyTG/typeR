library(dpcR)


### Name: bind_dpcr-methods
### Title: Bind dpcr objects
### Aliases: bind_dpcr-methods bind_dpcr bind_dpcr,adpcr
###   bind_dpcr,adpcr-method bind_dpcr,dpcr bind_dpcr,dpcr-method
###   bind_dpcr,list bind_dpcr,list-method
### Keywords: manip

### ** Examples


bigger_array <- sim_adpcr(400, 765, 1000, pos_sums = FALSE, n_panels = 5)
smaller_array <- sim_adpcr(100, 700, 1000, pos_sums = FALSE, n_panels = 3)
bound_arrays <- bind_dpcr(bigger_array, smaller_array)

smaller_droplet <- sim_dpcr(m = 7, n = 20, times = 5, n_exp = 2)
bigger_droplet <- sim_dpcr(m = 15, n = 25, times = 5, n_exp = 4)
biggest_droplet <- sim_dpcr(m = 15, n = 35, times = 5, n_exp = 1)
bound_droplets <- bind_dpcr(smaller_droplet, bigger_droplet, biggest_droplet)



