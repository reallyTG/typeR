library(fromo)


### Name: t_running_sd3
### Title: Compute first K moments over a sliding time-based window
### Aliases: t_running_sd3 t_running_skew4 t_running_kurt5 t_running_sd
###   t_running_skew t_running_kurt t_running_cent_moments
###   t_running_std_moments t_running_cumulants

### ** Examples

x <- rnorm(1e5)
xs3 <- t_running_sd3(x,time=seq_along(x),window=10)
xs4 <- t_running_skew4(x,time=seq_along(x),window=10)
# but what if you only cared about some middle values?
xs4 <- t_running_skew4(x,time=seq_along(x),lb_time=(length(x) / 2) + 0:10,window=20)




