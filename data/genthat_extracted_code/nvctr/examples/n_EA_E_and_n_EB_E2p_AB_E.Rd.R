library(nvctr)


### Name: n_EA_E_and_n_EB_E2p_AB_E
### Title: Find the delta position from two positions A and B
### Aliases: n_EA_E_and_n_EB_E2p_AB_E

### ** Examples

lat_EA <- rad(1); lon_EA <- rad(2); z_EA   <- 3
lat_EB <- rad(4); lon_EB <- rad(5); z_EB   <- 6

n_EA_E <- lat_lon2n_E(lat_EA, lon_EA)
n_EB_E <- lat_lon2n_E(lat_EB, lon_EB)

n_EA_E_and_n_EB_E2p_AB_E(n_EA_E, n_EB_E, z_EA, z_EB)




