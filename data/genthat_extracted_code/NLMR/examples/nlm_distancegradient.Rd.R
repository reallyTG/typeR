library(NLMR)


### Name: nlm_distancegradient
### Title: nlm_distancegradient
### Aliases: nlm_distancegradient

### ** Examples


# simulate a distance gradient
distance_gradient <- nlm_distancegradient(ncol = 100, nrow = 100,
                                           origin = c(20, 30, 10, 15))
## Not run: 
##D # visualize the NLM
##D landscapetools::show_landscape(distance_gradient)
## End(Not run)



