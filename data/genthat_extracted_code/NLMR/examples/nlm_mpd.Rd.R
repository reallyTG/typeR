library(NLMR)


### Name: nlm_mpd
### Title: nlm_mpd
### Aliases: nlm_mpd

### ** Examples


# simulate midpoint displacement
midpoint_displacememt <- nlm_mpd(ncol = 100,
                                 nrow = 100,
                                 roughness = 0.3)
## Not run: 
##D # visualize the NLM
##D landscapetools::show_landscape(midpoint_displacememt)
## End(Not run)



