library(r4lineups)


### Name: lineup_prop_boot
### Title: Bootstrapped lineup proportion
### Aliases: lineup_prop_boot

### ** Examples

lineup_vec <- round(runif(100, 1, 6))

bootobject <- boot::boot(lineup_vec, lineup_prop_boot, target_pos = 3, R = 1000)
cis <- boot::boot.ci(bootobject, conf = 0.95, type = "all")




