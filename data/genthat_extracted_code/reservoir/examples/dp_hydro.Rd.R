library(reservoir)


### Name: dp_hydro
### Title: Dynamic Programming for hydropower reservoirs
### Aliases: dp_hydro

### ** Examples

layout(1:4)
dp_hydro(resX$Q_Mm3, resX$cap_Mm3, surface_area = resX$A_km2,
installed_cap = resX$Inst_cap_MW, qmax = mean(resX$Q_Mm3), S_disc = 100)



