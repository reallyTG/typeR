library(dtwclust)


### Name: pam_cent
### Title: Centroid for partition around medoids
### Aliases: pam_cent

### ** Examples


# Computes the distance matrix for all series
pam_cent(CharTraj, "dtw_basic", ids = 6L:10L, window.size = 15L) # series_id = 7L

# Computes the distance matrix for the chosen subset only
pam_cent(CharTraj[6L:10L], "dtw_basic", window.size = 15L) # series_id = 2L




