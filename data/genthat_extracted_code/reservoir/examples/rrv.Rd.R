library(reservoir)


### Name: rrv
### Title: Reliability, resilience, and vulnerability analysis for water
###   supply reservoirs
### Aliases: rrv

### ** Examples

# Compare reliability, resilience and vulnerability for two operating policies (SOP and SDP).
rrv(resX$Q_Mm3, capacity = 20*resX$cap_Mm3, target = 0.95 * mean(resX$Q_Mm3))
pol_Markov <- sdp_supply(resX$Q_Mm3, capacity = 20 * resX$cap_Mm3,
target = 0.95 * mean(resX$Q_Mm3), Markov = TRUE)
rrv(resX$Q_Mm3, capacity = 20*resX$cap_Mm3, target = 0.95 * mean(resX$Q_Mm3), policy = pol_Markov)



