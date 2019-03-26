library(ss3sim)


### Name: plot_ts_lines
### Title: Plot timeseries values as lines.
### Aliases: plot_ts_lines

### ** Examples

ts_dat$SpawnBio <- with(ts_dat, (SpawnBio_om-SpawnBio_em)/SpawnBio_om)
# Merge in max_grad, a performance metric, to use for color
ts_dat <- merge(scalar_dat[, c("ID", "max_grad")], ts_dat)
plot_ts_lines(ts_dat, y = "SpawnBio", horiz = "D", vert = "E",
  relative.error = TRUE, color = "max_grad")



