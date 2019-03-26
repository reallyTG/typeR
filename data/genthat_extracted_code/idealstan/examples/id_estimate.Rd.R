library(idealstan)


### Name: id_estimate
### Title: Estimate an 'idealstan' model
### Aliases: id_estimate

### ** Examples

# First we can simulate data for an IRT 2-PL model that is inflated for missing data
library(ggplot2)
library(dplyr)

# This code will take at least a few minutes to run 
## Not run: 
##D bin_irt_2pl_abs_sim <- id_sim_gen(model_type='binary',inflate=T)
##D 
##D # Now we can put that directly into the id_estimate function 
##D # to get full Bayesian posterior estimates
##D # We will constrain discrimination parameters 
##D # for identification purposes based on the true simulated values
##D 
##D bin_irt_2pl_abs_est <- id_estimate(bin_irt_2pl_abs_sim,
##D                        model_type=2,
##D                        restrict_ind_high = 
##D                        sort(bin_irt_2pl_abs_sim@simul_data$true_person,
##D                        decreasing=TRUE,
##D                        index=TRUE)$ix[1],
##D                        restrict_ind_low = 
##D                        sort(bin_irt_2pl_abs_sim@simul_data$true_person
##D                        decreasing=FALSE,
##D                        index=TRUE)$ix[1],
##D                        fixtype='vb_partial',
##D                        ncores=2,
##D                        nchains=2)
##D                                    
##D # We can now see how well the model recovered the true parameters
##D 
##D id_sim_coverage(bin_irt_2pl_abs_est) %>% 
##D          bind_rows(.id='Parameter') %>% 
##D          ggplot(aes(y=avg,x=Parameter)) +
##D            stat_summary(fun.args=list(mult=1.96)) + 
##D            theme_minimal()
##D  
## End(Not run)

# In most cases, we will use pre-existing data 
# and we will need to use the id_make function first
# We will use the full rollcall voting data 
# from the 114th Senate as a rollcall object

data('senate114')

# Running this model will take at least a few minutes, even with 
# variational inference (use_vb=T) turned on
## Not run: 
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




