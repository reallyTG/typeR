library(idealstan)


### Name: id_plot_legis_var
### Title: Plot Legislator/Person Over-time Variances
### Aliases: id_plot_legis_var

### ** Examples


# To demonstrate, we load the 114th Senate data and fit a time-varying model

data('senate114_fit')

## Not run: 
##D senate_data <- id_make(senate114,outcome = 'cast_code',
##D person_id = 'bioname',
##D item_id = 'rollnumber',
##D group_id= 'party_code',
##D time_id='date',
##D miss_val='Absent')
##D 
##D  senate114_time_fit <- id_estimate(senate_data,
##D  model_type = 2,
##D  use_vb = T,
##D  fixtype='vb_partial',
##D  vary_ideal_pts='random_walk',
##D  restrict_ind_high = "WARREN, Elizabeth",
##D  restrict_ind_low="BARRASSO, John A.",
##D  seed=84520)
##D # We plot the variances for all the Senators
##D 
##D id_plot_legis_var(senate114_fit,item_plot=5)
## End(Not run)



