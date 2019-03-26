library(SWMPrExtension)


### Name: threshold_summary
### Title: Summary Plots for Threshold Identification
### Aliases: threshold_summary threshold_summary.swmpr

### ** Examples

## Water quality examples
dat_wq <- qaqc(apacpwq, qaqc_keep = c(0, 3, 5))
dat_wq <- setstep(dat_wq)

x <-
  threshold_summary(dat_wq, param = 'do_mgl', parameter_threshold = 2
  , threshold_type = '<', time_threshold = 2, summary_type = 'month'
  , plot_title = TRUE)

## Not run: 
##D y <-
##D   threshold_summary(dat_wq, param = 'do_mgl', parameter_threshold = 2,
##D   threshold_type = '<', time_threshold = 2, summary_type = 'season',
##D   season = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12)),
##D   season_names = c('Winter', 'Spring', 'Summer', 'Fall'),
##D   season_start = 'Winter',
##D   plot_title = TRUE)
##D 
##D ## Nutrient examples
##D dat_nut <- qaqc(apacpnut, qaqc_keep = c(0, 3, 5))
##D 
##D x <-
##D   threshold_summary(dat_nut, param = 'chla_n',
##D   parameter_threshold = 10,
##D   threshold_type = '>', summary_type = 'month',
##D   plot_title = TRUE)
##D 
##D y <-
##D   threshold_summary(dat_nut, param = 'chla_n', parameter_threshold = 10,
##D   threshold_type = '>', summary_type = 'season',
##D   season = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12)),
##D   season_names = c('Winter', 'Spring', 'Summer', 'Fall'),
##D   season_start = 'Winter', plot_title = TRUE)
##D 
##D  z <-
##D    threshold_summary(dat_nut, param = 'chla_n', parameter_threshold = 10,
##D    threshold_type = '>', summary_type = 'year',
##D    plot_title = TRUE, plot = TRUE)
## End(Not run)



