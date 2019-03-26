library(r4lineups)


### Name: esize_m_boot
### Title: Bootstrapped Effective Size
### Aliases: esize_m_boot

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))

#Get boot object:
bootobject <- boot::boot(lineup_vec, esize_m_boot, k = 6, R=1000)
bootobject

#To get confidence intervals:
cis <- boot::boot.ci(bootobject, conf = 0.95, type = "all")




