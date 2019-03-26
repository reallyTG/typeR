library(AGread)


### Name: reintegrate
### Title: Reintegrate a data stream
### Aliases: reintegrate

### ** Examples


data("imu_to_check", package = "AGread")
ag <-
  imu_to_check[ ,c("Timestamp", "mean_abs_Gyroscope_x_DegPerS")]

# Forwards reintegration
  reintegrate(
    ag = ag,
    to = 60,
    time_var = "Timestamp",
    direction = c("forwards")
  )

# Backwards reintegration
  reintegrate(
    ag = ag,
    to = 60,
    time_var = "Timestamp",
    direction = c("backwards")
  )
## Not run: 
##D # Erronious usages that will give a warning
##D   reintegrate(
##D     ag = ag,
##D     to = 60,
##D     time_var = "Timestamp",
##D     direction = c("forwards", "backwards")
##D   )
##D 
##D   reintegrate(
##D     ag = ag,
##D     to = 60,
##D     time_var = "Timestamp"
##D   )
## End(Not run)




