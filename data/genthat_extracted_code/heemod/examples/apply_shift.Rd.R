library(heemod)


### Name: apply_shift
### Title: Apply a time shift to a survival distribution
### Aliases: apply_shift

### ** Examples


dist1 <- define_survival(distribution = "gamma", rate = 0.25, shape = 3)
shift_dist <- apply_shift(dist1, 4)
compute_surv(dist1, 1:10)
compute_surv(shift_dist, 1:10)



