library(ss3sim)


### Name: plot_ts_boxplot
### Title: Plot timeseries values as boxplots.
### Aliases: plot_ts_boxplot

### ** Examples

## Not run: 
##D ts_dat$SpawnBio <- with(ts_dat, (SpawnBio_om-SpawnBio_em)/SpawnBio_om)
##D # Merge in max_grad, a performance metric, to use for color
##D ts_dat <- merge(scalar_dat[, c("ID", "max_grad")], ts_dat)
##D plot_ts_boxplot(ts_dat, y = "SpawnBio", horiz = "D", vert = "E",
##D   relative.error = TRUE)
## End(Not run)



