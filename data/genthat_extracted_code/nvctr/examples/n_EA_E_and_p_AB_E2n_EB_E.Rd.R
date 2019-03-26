library(nvctr)


### Name: n_EA_E_and_p_AB_E2n_EB_E
### Title: Find position B from position A and delta
### Aliases: n_EA_E_and_p_AB_E2n_EB_E

### ** Examples

p_BC_B <- c(3000, 2000, 100)

# Position and orientation of B is given:
n_EB_E <- unit(c(1,2,3))  # unit to get unit length of vector
z_EB <- -400
R_NB  <- zyx2R(rad(10), rad(20), rad(30)) # yaw, pitch, and roll
R_EN <- n_E2R_EN(n_EB_E)
R_EB <- R_EN %*% R_NB

# Decompose the delta vector in E:
p_BC_E <- (R_EB %*% p_BC_B) %>% as.vector() # no transpose of R_EB, since the vector is in B

# Find the position of C, using the functions that goes from one
# position and a delta, to a new position:
(n_EB_E <- n_EA_E_and_p_AB_E2n_EB_E(n_EB_E, p_BC_E, z_EB))




