## ------------------------------------------------------------------------
library(oaqc)
### k4, pure R
k4 <- data.frame(
    source = c(0, 0, 0, 1, 1, 2),
    target = c(1, 2, 3, 2, 3, 3)
)
k4orbits <- oaqc(k4, non_ind_freq = F, file = "")
# print(k4orbits)

## ------------------------------------------------------------------------
print(k4orbits$n_orbits_ind[,10])

