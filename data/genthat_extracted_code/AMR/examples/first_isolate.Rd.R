library(AMR)


### Name: first_isolate
### Title: Determine first (weighted) isolates
### Aliases: first_isolate
### Keywords: first isolate isolates

### ** Examples

# septic_patients is a dataset available in the AMR package. It is true, genuine data.
?septic_patients

library(dplyr)
my_patients <- septic_patients %>%
  mutate(first_isolate = first_isolate(.,
                                       col_date = "date",
                                       col_patient_id = "patient_id",
                                       col_mo = "mo"))

# Now let's see if first isolates matter:
A <- my_patients %>%
  group_by(hospital_id) %>%
  summarise(count = n_rsi(gent),            # gentamicin availability
            resistance = portion_IR(gent))  # gentamicin resistance

B <- my_patients %>%
  filter(first_isolate == TRUE) %>%         # the 1st isolate filter
  group_by(hospital_id) %>%
  summarise(count = n_rsi(gent),            # gentamicin availability
            resistance = portion_IR(gent))  # gentamicin resistance

# Have a look at A and B.
# B is more reliable because every isolate is only counted once.
# Gentamicin resitance in hospital D appears to be 5.4% higher than
# when you (erroneously) would have used all isolates!

## OTHER EXAMPLES:

## Not run: 
##D 
##D # set key antibiotics to a new variable
##D tbl$keyab <- key_antibiotics(tbl)
##D 
##D tbl$first_isolate <-
##D   first_isolate(tbl)
##D 
##D tbl$first_isolate_weighed <-
##D   first_isolate(tbl,
##D                 col_keyantibiotics = 'keyab')
##D 
##D tbl$first_blood_isolate <-
##D   first_isolate(tbl,
##D                 filter_specimen = 'Blood')
##D 
##D tbl$first_blood_isolate_weighed <-
##D   first_isolate(tbl,
##D                 filter_specimen = 'Blood',
##D                 col_keyantibiotics = 'keyab')
##D 
##D tbl$first_urine_isolate <-
##D   first_isolate(tbl,
##D                 filter_specimen = 'Urine')
##D 
##D tbl$first_urine_isolate_weighed <-
##D   first_isolate(tbl,
##D                 filter_specimen = 'Urine',
##D                 col_keyantibiotics = 'keyab')
##D 
##D tbl$first_resp_isolate <-
##D   first_isolate(tbl,
##D                 filter_specimen = 'Respiratory')
##D 
##D tbl$first_resp_isolate_weighed <-
##D   first_isolate(tbl,
##D                 filter_specimen = 'Respiratory',
##D                 col_keyantibiotics = 'keyab')
## End(Not run)



