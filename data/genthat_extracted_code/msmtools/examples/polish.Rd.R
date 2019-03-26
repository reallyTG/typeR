library(msmtools)


### Name: polish
### Title: Remove observations with different states occurring at the same
###   time
### Aliases: polish

### ** Examples


# loading data
data( hosp )

# augmenting longitudinal data
hosp_aug = augment( data = hosp, data_key = subj, n_events = adm_number,
                    pattern = label_3, t_start = dateIN, t_end = dateOUT,
                    t_cens = dateCENS )

# cleaning any targeted occurrence
hosp_aug_clean = polish( data = hosp_aug, data_key = subj, pattern = label_3 )




