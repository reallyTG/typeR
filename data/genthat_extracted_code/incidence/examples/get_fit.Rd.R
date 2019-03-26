library(incidence)


### Name: get_fit
### Title: Accessors for 'incidence_fit' objects
### Aliases: get_fit get_fit.incidence_fit get_fit.incidence_fit_list
###   get_info get_info.incidence_fit get_info.incidence_fit_list

### ** Examples


if (require(outbreaks)) { withAutoprint({

 dat <- ebola_sim$linelist$date_of_onset

 ## EXAMPLE WITH A SINGLE MODEL

 ## compute weekly incidence
 sex <- ebola_sim$linelist$gender
 i.sex <- incidence(dat, interval = 7, group = sex)
 
 ## Compute the optimal split for each group separately
 fits  <- fit_optim_split(i.sex, separate_split = TRUE)

 ## `fits` contains an `incidence_fit_list` object
 fits$fit
 
 ## Grab the list of `incidence_fit` objects
 get_fit(fits$fit)
 
 ## Get the predictions for all groups
 get_info(fits$fit, "pred", groups = 1)
 
 ## Get the predictions, but set `groups` to "before" and "after"
 get_info(fits$fit, "pred", groups = 2)
 
 ## Get the reproduction number
 get_info(fits$fit, "r")

 ## Get the doubling confidence interval
 get_info(fits$fit, "doubling.conf")

 ## Get the halving confidence interval
 get_info(fits$fit, "halving.conf")
})}



