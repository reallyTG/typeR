library(SWMPrExtension)


### Name: seasonal_dot
### Title: Seasonal Dot Plot
### Aliases: seasonal_dot seasonal_dot.swmpr

### ** Examples

dat_wq <- elksmwq
#dat_wq <- subset(dat_wq, subset = c('2010-01-01 0:00', '2017-01-01 0:00'))
dat_wq <- qaqc(dat_wq, qaqc_keep = c(0, 3, 5))

x <-
  seasonal_dot(dat_wq, param = 'do_mgl'
               , lm_trend = TRUE
               , lm_lab = TRUE
               , plot_title = TRUE)

## Not run: 
##D x <-
##D   seasonal_dot(dat_wq, param = 'do_mgl'
##D                , lm_trend = FALSE
##D                , lm_lab = FALSE
##D                , plot_title = TRUE)
##D 
##D x <-
##D   seasonal_dot(dat_wq, param = 'do_mgl'
##D                , lm_trend = TRUE
##D                , lm_lab = FALSE
##D                , plot_title = TRUE)
##D 
##D 
##D dat_nut <- elknmnut
##D dat_nut <- subset(dat_nut, subset = c('2007-01-01 0:00', '2017-01-01 0:00'))
##D dat_nut <- qaqc(dat_nut, qaqc_keep = c(0, 3, 5))
##D 
##D x <-
##D   seasonal_dot(dat_nut
##D                , param = 'chla_n'
##D                , season_grps = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12))
##D                , season_names = c('Winter', 'Spring', 'Summer', 'Fall')
##D                , season_start = 'Spring'
##D                , lm_trend = FALSE
##D                , lm_lab = FALSE
##D                , plot_title = TRUE)
##D 
##D x <-
##D   seasonal_dot(dat_nut, param = 'chla_n'
##D                , lm_trend = TRUE
##D                , lm_lab = FALSE
##D                , plot_title = TRUE)
##D 
##D x <-
##D   seasonal_dot(dat_nut, param = 'chla_n'
##D                , lm_trend = TRUE
##D                , lm_lab = TRUE
##D                , plot_title = TRUE)
## End(Not run)



