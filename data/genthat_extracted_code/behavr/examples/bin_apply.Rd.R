library(behavr)


### Name: bin_apply
### Title: Bin a variable (typically time) and compute an aggregate for
###   each bin
### Aliases: bin_apply bin_apply_all

### ** Examples

metadata <- data.frame(id = paste0("toy_experiment|",1:5))
dt <- toy_activity_data(metadata, duration = days(2))

# average by 30min time bins, default
dt_binned <- bin_apply_all(dt, moving)
# equivalent to
dt_binned <- dt[, bin_apply(.SD, moving), by = "id"]

# if we want the opposite of moving:
dt_binned <- bin_apply_all(dt, !moving)

# More advanced usage
dt <- toy_dam_data(metadata, duration = days(2))

# sum activity per 60 minutes
dt_binned <- bin_apply_all(dt,
                           activity,
                           x = t,
                           x_bin_length = mins(60),
                           FUN = sum)


# average activity. Time in ZT
dt_binned <- bin_apply_all(dt,
                           activity,
                           x = t,
                           wrap_x_by = days(1)
                           )



