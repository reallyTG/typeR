library(reservoir)


### Name: simRes
### Title: Simulate a water supply reservoir with specified operating
###   policy.
### Aliases: simRes

### ** Examples

# simulate a reservoir assuming standard operating policy, then compare with SDP-derived policy
#trained on historical flows.

# DEFINE RESERVOIR SPECS AND MODEL INPUTS
res_cap <- 1500 #Mm3
targ <- 150 #Mm3
area <- 40 #km2
max_d <- 40 #m
ev = 0.2 #m
Q_pre1980 <- window(resX$Q_Mm3, end = c(1979, 12), frequency = 12)
Q_post1980 <- window(resX$Q_Mm3, start = c(1980, 1), frequency = 12)

# SIMULATE WITH SOP
layout(1:3)
simSOP <- simRes(Q_post1980, capacity = res_cap, target = targ,
surface_area = area, max_depth = max_d, evap = ev)

# TRAIN SDP POLICY ON HISTORICAL FLOWS
policy_x <- sdp_supply(Q_pre1980, capacity = res_cap, target = targ,
surface_area = area, max_depth = max_d, evap = ev, Markov = TRUE, plot = FALSE, S_disc = 100)

# SIMULATE WITH SDP-DERIVED POLICY
simSDP <- simRes(Q_post1980, capacity = res_cap, target = targ,
surface_area = area, max_depth = max_d, evap = ev, policy = policy_x)



