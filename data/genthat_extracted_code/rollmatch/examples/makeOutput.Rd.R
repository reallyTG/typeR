library(rollmatch)


### Name: makeOutput
### Title: Combine the results of rollmatch into a tidy list for output As
###   it's an internal helper function to aid in testing, it is not
###   exported for use outside of the package.
### Aliases: makeOutput
### Keywords: internal

### ** Examples

## Not run: 
##D  
##D orig.call <- "Ignore"
##D formula <- as.formula(treat ~ qtr_pmt + yr_pmt + age + is_male + is_white +
##D                        is_disabled + is_esrd + months_dual + chron_num + lq_ed +
##D                        yr_ed2 + lq_ip + yr_ip2)
##D tm <- "quarter"; entry <- "entry_q"; lookback <- 1
##D load(url(paste0("https://github.com/RTIInternational/rollmatch/raw/master/",
##D                 "tests/testthat/output.rda")))
##D pred_model <- output$pred_model
##D lr_result <- output$lr_result
##D load(url(paste0("https://github.com/RTIInternational/rollmatch/raw/master/",
##D                 "tests/testthat/out_list.rda")))
##D data_full <- out_list$data_full
##D matches <- out_list$matches
##D out <- makeOutput(pred_model, lr_result, data_full, matches, orig.call,
##D                   formula, tm, entry, lookback)
##D head(out)
## End(Not run)




