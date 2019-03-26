library(msmtools)


### Name: augment
### Title: A fast and general method for building augmented data
### Aliases: augment

### ** Examples

# loading data
data( hosp )

# 1.
# augmenting hosp
hosp_augmented = augment( data = hosp, data_key = subj, n_events = adm_number,
                          pattern = label_3, t_start = dateIN, t_end = dateOUT,
                          t_cens = dateCENS )

# 2.
# augmenting hosp by passing more information regarding transitions
# with argument more_status
hosp_augmented_more = augment( data = hosp, data_key = subj, n_events = adm_number,
                               pattern = label_3, t_start = dateIN, t_end = dateOUT,
                               t_cens = dateCENS, more_status = rehab_it )
# 3.
# augmenting hosp and returning a data.frame
hosp_augmented = augment( data = hosp, data_key = subj, n_events = adm_number,
                          pattern = label_3, t_start = dateIN, t_end = dateOUT,
                          t_cens = dateCENS, convert = TRUE )
class( hosp_augmented )




