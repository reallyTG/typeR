library(idealstan)


### Name: id_plot_legis
### Title: Plot Legislator/Person and Bill/Item Ideal Points
### Aliases: id_plot_legis

### ** Examples


## Not run: 
##D 
##D # First create data and run a model
##D 
##D to_idealstan <-   id_make(score_data = senate114,
##D outcome = 'cast_code',
##D person_id = 'bioname',
##D item_id = 'rollnumber',
##D group_id= 'party_code',
##D time_id='date',
##D high_val='Yes',
##D low_val='No',
##D miss_val='Absent')
##D 
##D sen_est <- id_estimate(senate_data,
##D model_type = 2,
##D use_vb = TRUE,
##D fixtype='vb_partial',
##D restrict_ind_high = "BARRASSO, John A.",
##D restrict_ind_low = "WARREN, Elizabeth")
##D 
##D # After running the model, we can plot 
##D # the results of the person/legislator ideal points
##D 
##D id_plot_legis(sen_est)
## End(Not run)




