library(knotR)


### Name: badness
### Title: Badness of knots
### Aliases: badness curvature_switching_badness
###   curvature_consecutive_segment_switching_badness midpoint_badness
###   node_crossing_badness total_string_length total_bending_energy
###   total_crossing_potential_energy total_crossing_angles
###   always_left_badness metrics
###   non_crossing_strand_close_approach_badness

### ** Examples



# use the k_infinity knot for speed:

system.time(badness(k_infinity))

cc <- crossing_points(k_infinity)

system.time(badness(k_infinity,cc))


metrics(k_infinity,cc)



