library(SWMPrExtension)


### Name: threshold_percentile_plot
### Title: Threshold Percentile Plot
### Aliases: threshold_percentile_plot threshold_percentile_plot.swmpr

### ** Examples

dat_wq <- qaqc(elksmwq, qaqc_keep = c(0, 3, 5))
dat_wq <- subset(dat_wq, subset = '2007-01-01 0:00', operator = '>=')

x <-
  threshold_percentile_plot(dat_wq, param = 'do_mgl'
  , hist_rng = c(2007, 2014), by_month = FALSE)

## Not run: 
##D y <-
##D   threshold_percentile_plot(dat_wq, param = 'do_mgl', percentiles = c(0.95)
##D   , hist_rng = c(2007, 2014), target_yr = 2014, by_month = FALSE)
##D 
##D x2 <-
##D   threshold_percentile_plot(dat_wq, param = 'do_mgl'
##D   , hist_rng = c(2007, 2014), by_month = TRUE)
##D 
##D y2 <-
##D   threshold_percentile_plot(dat_wq, param = 'do_mgl'
##D   , hist_rng = c(2007, 2014), target_yr = 2014, by_month = TRUE)
##D 
##D 
##D dat_nut <- qaqc(elknmnut, qaqc_keep = c(0, 3, 5))
##D dat_nut <- subset(dat_nut, subset = '2007-01-01 0:00', operator = '>=')
##D dat_nut <- rem_reps(dat_nut)
##D 
##D x <-
##D   threshold_percentile_plot(dat_nut, param = 'chla_n'
##D   , hist_rng = c(2007, 2014), by_month = FALSE)
##D 
##D y <-
##D   threshold_percentile_plot(dat_nut, param = 'chla_n'
##D   , hist_rng = c(2007, 2014), target_yr = 2016, by_month = FALSE)
## End(Not run)




