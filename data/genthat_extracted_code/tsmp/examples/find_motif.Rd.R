library(tsmp)


### Name: find_motif
### Title: Search for Motifs
### Aliases: find_motif find_motif.MatrixProfile
###   find_motif.MultiMatrixProfile

### ** Examples

# Single dimension data
w <- 50
data <- mp_gait_data
mp <- tsmp(data, window_size = w, exclusion_zone = 1/4, verbose = 0)
mp <- find_motif(mp)

# Multidimension data
w <- mp_toy_data$sub_len
data <- mp_toy_data$data[1:300, ]
mp <- tsmp(data, window_size = w, mode = "mstomp", verbose = 0)
mp <- find_motif(mp)



