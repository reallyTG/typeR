library(SWMPrExtension)


### Name: threshold_identification
### Title: Tabulate Threshold Exceedances
### Aliases: threshold_identification threshold_identification.swmpr

### ** Examples

wq <- apacpwq

dat_wq <- qaqc(wq, qaqc_keep = c(0, 3, 5))
dat_wq <- setstep(dat_wq)

wq_pars<- threshold_identification(dat_wq, param = c('do_mgl', 'ph', 'temp')
                          , parameter_threshold = c(2, 5, 30)
                          , threshold_type = c('<', '<', '>'), time_threshold = 2)

## Not run: 
##D wq_par<- threshold_identification(dat_wq, param = c('do_mgl')
##D                           , parameter_threshold = c(2)
##D                           , threshold_type = c('<'), time_threshold = 2)
##D 
##D 
##D ## time_threshold and setstep are not necessary for monthly parameters
##D nut <- apacpnut
##D 
##D dat_nut <- qaqc(nut, qaqc_keep = c(0, 3, 5))
##D 
##D nut_pars <- threshold_identification(dat_nut, param = c('chla_n', 'po4f')
##D                           , parameter_threshold = c(10, 0.01)
##D                           , threshold_type = c('>', '>'))
##D 
##D nut_par <- threshold_identification(dat_nut, param = c('chla_n')
##D                           , parameter_threshold = c(10)
##D                           , threshold_type = c('>'))
##D 
##D nut_err <- threshold_identification(dat_nut, param = c('chla_n')
##D                           , parameter_threshold = c(30)
##D                           , threshold_type = c('>'))
##D 
## End(Not run)



