library(msmtools)


### Name: prevplot
### Title: Plot observed and expected prevalences for a multi-state model
### Aliases: prevplot

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
##D # defining the times at which compute the prevalences
##D t_min = min( hosp_augmented$augmented_int )
##D t_max = max( hosp_augmented$augmented_int )
##D steps = 100L
##D 
##D # computing prevalences
##D prev = prevalence.msm( msm_model, covariates = 'mean', ci = 'normal',
##D                        times = seq( t_min, t_max, steps ) )
##D 
##D # and plotting them using prevplot()
##D prevplot( msm_model, prev, ci = TRUE, devnew = FALSE, verbose = FALSE )
## End(Not run)




