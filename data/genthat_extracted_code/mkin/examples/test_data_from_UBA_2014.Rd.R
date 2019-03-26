library(mkin)


### Name: test_data_from_UBA_2014
### Title: Three experimental datasets from two water sediment systems and
###   one soil
### Aliases: test_data_from_UBA_2014
### Keywords: datasets

### ** Examples

  ## Not run: 
##D   # This is a level P-II evaluation of the dataset according to the FOCUS kinetics
##D   # guidance. Due to the strong correlation of the parameter estimates, the
##D   # covariance matrix is not returned. Note that level P-II evaluations are
##D   # generally considered deprecated due to the frequent occurrence of such
##D   # large parameter correlations, among other reasons (e.g. the adequacy of the
##D   # model).
##D   m_ws <- mkinmod(parent_w = mkinsub("SFO", "parent_s"),
##D                   parent_s = mkinsub("SFO", "parent_w"))
##D   f_river <- mkinfit(m_ws, test_data_from_UBA_2014[[1]]$data, quiet = TRUE)
##D   plot_sep(f_river)
##D 
##D   summary(f_river)$bpar
##D   mkinerrmin(f_river)
##D 
##D   # This is the evaluation used for the validation of software packages
##D   # in the expertise from 2014
##D   m_soil <- mkinmod(parent = mkinsub("SFO", c("M1", "M2")),
##D                     M1 = mkinsub("SFO", "M3"),
##D                     M2 = mkinsub("SFO", "M3"),
##D                     M3 = mkinsub("SFO"),
##D                     use_of_ff = "max")
##D 
##D   f_soil <- mkinfit(m_soil, test_data_from_UBA_2014[[3]]$data, quiet = TRUE)
##D   plot_sep(f_soil, lpos = c("topright", "topright", "topright", "bottomright"))
##D   summary(f_soil)$bpar
##D   mkinerrmin(f_soil)
##D   
## End(Not run)



