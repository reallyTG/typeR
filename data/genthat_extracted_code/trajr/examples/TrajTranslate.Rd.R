library(trajr)


### Name: TrajTranslate
### Title: Translate a trajectory
### Aliases: TrajTranslate

### ** Examples

# Shift a trajectory so that its origin is (10, 15).
# Note that trajectories created by TrajGenerate always start at (0, 0)
set.seed(42)
trj <- TrajGenerate()
trj <- TrajTranslate(trj, 10, 15)

# Translate a trajectory so its origin (0, 0)
trj <- TrajTranslate(trj, -trj$x[1], -trj$y[1])




