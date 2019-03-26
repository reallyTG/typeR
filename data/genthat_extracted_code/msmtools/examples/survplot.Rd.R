library(msmtools)


### Name: survplot
### Title: Plot and get survival data from a multi-state model
### Aliases: survplot

### ** Examples

## Not run: 
##D data( hosp )
##D 
##D # augmenting the data
##D hosp_augmented = augment( data = hosp, data_key = subj, n_events = adm_number,
##D                           pattern = label_3, t_start = dateIN, t_end = dateOUT,
##D                           t_cens = dateCENS )
##D 
##D # let's define the initial transition matrix for our model
##D Qmat = matrix( data = 0, nrow = 3, ncol = 3, byrow = TRUE )
##D Qmat[ 1, 1:3 ] = 1
##D Qmat[ 2, 1:3 ] = 1
##D colnames( Qmat ) = c( 'IN', 'OUT', 'DEAD' )
##D rownames( Qmat ) = c( 'IN', 'OUT', 'DEAD' )
##D 
##D # attaching the msm package and running the model using
##D # gender and age as covariates
##D library( msm )
##D msm_model = msm( status_num ~ augmented_int, subject = subj,
##D                  data = hosp_augmented, covariates = ~ gender + age,
##D                  exacttimes = TRUE, gen.inits = TRUE, qmatrix = Qmat,
##D                  method = 'BFGS', control = list( fnscale = 6e+05, trace = 0,
##D                  REPORT = 1, maxit = 10000 ) )
##D 
##D # plotting the fitted and empirical survival from state = 1
##D survplot( msm_model, km = TRUE, ci = 'none',
##D           verbose = FALSE )
##D 
##D # plotting the fitted and empirical survival from state = 2 and
##D # adding it to the previous plot
##D survplot( msm_model, from = 2, km = TRUE, ci = 'none', add = TRUE,
##D           verbose = FALSE )
##D 
##D # returning fitted and empirical data
##D all_data = survplot( msm_model, ci = 'none', return.all = TRUE,
##D                      verbose = FALSE, do.plot = FALSE )
##D 
##D # saving them separately
##D km_data = all_data[[ 1 ]]
##D fitted_data = all_data[[ 2 ]]
## End(Not run)




