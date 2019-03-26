library(SWMPrExtension)


### Name: threshold_criteria_plot
### Title: Water Quality Threshold Plot For Parameters With Criteria
### Aliases: threshold_criteria_plot threshold_criteria_plot.swmpr

### ** Examples

data(apacpwq)
dat_wq <- apacpwq

dat_wq <- qaqc(dat_wq, qaqc_keep = c(0, 3, 5))

## Due to the volume of instantaneous data, these plots are a bit slow
x <-
  threshold_criteria_plot(dat_wq, param = 'do_mgl'
                 , rng = 2012
                 , thresholds = c(2, 5)
                 , threshold_labs = c('Poor', 'Fair', 'Good')
                 , monthly_smooth = TRUE
                 , threshold_cols = c('#FEC596', '#FFFFCC', '#ABD9E9'))

## Not run: 
##D y <-
##D   threshold_criteria_plot(dat_wq, param = 'do_mgl'
##D                  , thresholds = c(2, 5)
##D                  , threshold_labs = c('Poor', 'Fair', 'Good')
##D                  , threshold_cols = c('#FEC596', '#FFFFCC', '#ABD9E9'))
##D 
##D z <-
##D   threshold_criteria_plot(dat_wq, param = 'do_mgl'
##D                  , rng = 2012
##D                  , thresholds = c(2, 5)
##D                  , threshold_labs = c('Poor', 'Fair', 'Good')
##D                  , threshold_cols = c('#FEC596', '#FFFFCC', '#ABD9E9')
##D                  , monthly_smooth = TRUE)
##D 
##D ## A few examples with only two thresholds
##D xx <-
##D   threshold_criteria_plot(dat_wq, param = 'do_mgl'
##D                  , rng = 2012
##D                  , thresholds = c(2, 2)
##D 
##D                   # A dummy blank ('') value must be added as a threshold label
##D                  , threshold_labs = c('Poor', '', 'Good')
##D                  , threshold_cols = c('#FEC596', '#FFFFCC', '#ABD9E9')
##D                  , monthly_smooth = TRUE)
##D 
##D xy <-
##D   threshold_criteria_plot(dat_wq, param = 'do_mgl'
##D                  , rng = 2012
##D                  , thresholds = c(5, 5)
##D 
##D                  # A dummy blank ('') value must be added as a threshold label
##D                  , threshold_labs = c('Poor', '', 'Good')
##D                  , threshold_cols = c('#FEC596', '#FEC596', '#ABD9E9')
##D                  , monthly_smooth = TRUE)
##D 
##D xz <-
##D   threshold_criteria_plot(dat_wq, param = 'do_mgl'
##D                  , rng = 2012
##D                  , thresholds = c(2, 5)
##D                  , threshold_labs = c('Poor', 'Good', 'Poor')
##D                  , threshold_cols = c('#FEC596', '#ABD9E9', '#FEC596')
##D                  , monthly_smooth = TRUE)
##D 
##D 
##D data(apacpnut)
##D dat_nut <- apacpnut
##D 
##D dat_nut <- qaqc(dat_nut, qaqc_keep = c(0, 3, 5))
##D dat_nut <- rem_reps(dat_nut)
##D 
##D x <-
##D   threshold_criteria_plot(dat_nut, param = 'chla_n'
##D                  , thresholds = c(2, 5)
##D                  , threshold_labs = c('Good', 'Fair', 'Poor'))
##D 
##D 
##D y <-
##D   threshold_criteria_plot(dat_nut, param = 'chla_n'
##D                  , rng = 2012
##D                  , thresholds = c(2, 5)
##D                  , threshold_labs = c('Good', 'Fair', 'Poor'))
##D 
##D ## Nutrient plots are not capable of accidentally displaying any kind of smooth
##D z <-
##D   threshold_criteria_plot(dat_nut, param = 'chla_n'
##D                  , rng = 2012
##D                  , thresholds = c(2, 5)
##D                  , threshold_labs = c('Good', 'Fair', 'Poor')
##D                  , monthly_smooth = TRUE)
## End(Not run)



