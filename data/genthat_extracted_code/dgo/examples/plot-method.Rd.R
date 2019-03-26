library(dgo)


### Name: dgirt_plot
### Title: Plot estimates and diagnostic statistics
### Aliases: dgirt_plot dgirt_plot,dgo_fit-method
###   dgirt_plot,data.frame-method plot,dgo_fit,missing-method plot_rhats
###   plot_rhats,dgo_fit-method

### ** Examples

## Not run: 
##D data(toy_dgirtfit)
##D dgirt_plot(toy_dgirtfit)
##D dgirt_plot(toy_dgirtfit, y_min = NULL, y_max = NULL)
##D p <- dgirt_plot(toy_dgirtfit)
##D p %+% ylab("posterior median")
## End(Not run)
## Not run: 
##D data(toy_dgirtfit)
##D ps <- poststratify(toy_dgirtfit, annual_state_race_targets, strata_names =
##D                    c("state", "year"), aggregated_names = "race3")
##D dgirt_plot(ps, group_name = NULL, time_name = "year", geo_name = "state")
## End(Not run)
## Not run: 
##D data(toy_dgirtfit)
##D plot(toy_dgirtfit)
## End(Not run)
## Not run: 
##D data(toy_dgirtfit)
##D plot_rhats(toy_dgirtfit)
##D plot_rhats(toy_dgirtfit, facet_vars = "race3") +
##D   scale_x_continuous(breaks = seq.int(2006, 2008))
## End(Not run)



