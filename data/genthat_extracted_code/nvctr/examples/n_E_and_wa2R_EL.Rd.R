library(nvctr)


### Name: n_E_and_wa2R_EL
### Title: Find 'R_EL' from n-vector and wander azimuth angle
### Aliases: n_E_and_wa2R_EL

### ** Examples

# Calculates the rotation matrix (direction cosine matrix) R_EL
# using n-vector (n_E) and the wander azimuth angle.
n_E <- c(1, 0, 0)
(R_EL <-  n_E_and_wa2R_EL(n_E, wander_azimuth = pi / 2))




