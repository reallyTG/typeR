library(reservoir)


### Name: sdp_hydro
### Title: Stochastic Dynamic Programming for hydropower reservoirs
### Aliases: sdp_hydro

### ** Examples

layout(1:4)
sdp_hydro(resX$Q_Mm3, resX$cap_Mm3, surface_area = resX$A_km2,
installed_cap = resX$Inst_cap_MW, qmax = mean(resX$Q_Mm3))
sdp_hydro(resX$Q_Mm3, resX$cap_Mm3, surface_area = resX$A_km2,
installed_cap = resX$Inst_cap_MW, qmax = mean(resX$Q_Mm3), Markov = TRUE)



