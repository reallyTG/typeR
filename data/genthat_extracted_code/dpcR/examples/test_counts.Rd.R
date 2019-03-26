library(dpcR)


### Name: test_counts
### Title: Test counts
### Aliases: test_counts

### ** Examples

#be warned, the examples of test_counts are time-consuming
## Not run: 
##D adpcr1 <- sim_adpcr(m = 10, n = 765, times = 1000, pos_sums = FALSE, n_panels = 3)
##D adpcr2 <- sim_adpcr(m = 60, n = 550, times = 1000, pos_sums = FALSE, n_panels = 3)
##D adpcr2 <- rename_dpcr(adpcr2, exper = "Experiment2")
##D adpcr3 <- sim_adpcr(m = 10, n = 600, times = 1000, pos_sums = FALSE, n_panels = 3)
##D adpcr3 <- rename_dpcr(adpcr3, exper = "Experiment3")
##D 
##D #compare experiments using binomial regression
##D two_groups_bin <- test_counts(bind_dpcr(adpcr1, adpcr2), model = "binomial")
##D summary(two_groups_bin)
##D plot(two_groups_bin)
##D #plot aggregated results
##D plot(two_groups_bin, aggregate = TRUE)
##D #get coefficients
##D coef(two_groups_bin)
##D 
##D #this time use Poisson regression
##D two_groups_pois <- test_counts(bind_dpcr(adpcr1, adpcr2), model = "poisson")
##D summary(two_groups_pois)
##D plot(two_groups_pois)
##D 
##D #see how test behaves when results aren't significantly different
##D one_group <- test_counts(bind_dpcr(adpcr1, adpcr3))
##D summary(one_group)
##D plot(one_group)
## End(Not run)



