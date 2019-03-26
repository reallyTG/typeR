library(rollmatch)


### Name: runModel
### Title: Run a logistic or probit model As it's an internal helper
###   function to aid in testing, it is not exported for use outside of the
###   package.
### Aliases: runModel
### Keywords: internal

### ** Examples

## Not run: 
##D data(package="rollmatch", "rem_synthdata_small")
##D formula <- as.formula(treat ~ qtr_pmt + age + is_male + is_white +
##D                        is_disabled + is_esrd + months_dual + chron_num + lq_ed +
##D                        yr_ed2 + lq_ip + yr_ip2)
##D vars <- all.vars(formula); treat <- vars[1]
##D tm <- "quarter"; entry <- "entry_q"; id <- "indiv_id"
##D model_type <- "logistic"; match_on <- "logit"
##D reduced_data <- chr_2_factor(rem_synthdata_small, vars)
##D model_output <- runModel(model_type, match_on, rem_synthdata_small, id, treat, entry,
##D               tm, formula)
##D head(model_output)
## End(Not run)




