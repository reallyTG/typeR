library(AMR)


### Name: portion
### Title: Calculate resistance of isolates
### Aliases: portion portion_R portion_IR portion_I portion_SI portion_S
###   portion_df
### Keywords: antibiotics isolate isolates resistance rsi rsi_df
###   susceptibility

### ** Examples

# septic_patients is a data set available in the AMR package. It is true, genuine data.
?septic_patients

# Calculate resistance
portion_R(septic_patients$amox)
portion_IR(septic_patients$amox)

# Or susceptibility
portion_S(septic_patients$amox)
portion_SI(septic_patients$amox)

# Do the above with pipes:
library(dplyr)
septic_patients %>% portion_R(amox)
septic_patients %>% portion_IR(amox)
septic_patients %>% portion_S(amox)
septic_patients %>% portion_SI(amox)

septic_patients %>%
  group_by(hospital_id) %>%
  summarise(p = portion_S(cipr),
            n = n_rsi(cipr)) # n_rsi works like n_distinct in dplyr

septic_patients %>%
  group_by(hospital_id) %>%
  summarise(R = portion_R(cipr, as_percent = TRUE),
            I = portion_I(cipr, as_percent = TRUE),
            S = portion_S(cipr, as_percent = TRUE),
            n = n_rsi(cipr), # works like n_distinct in dplyr
            total = n())     # NOT the amount of tested isolates!

# Calculate co-resistance between amoxicillin/clav acid and gentamicin,
# so we can see that combination therapy does a lot more than mono therapy:
septic_patients %>% portion_S(amcl)       # S = 67.3%
septic_patients %>% n_rsi(amcl)           # n = 1570

septic_patients %>% portion_S(gent)       # S = 74.0%
septic_patients %>% n_rsi(gent)           # n = 1842

septic_patients %>% portion_S(amcl, gent) # S = 92.1%
septic_patients %>% n_rsi(amcl, gent)     # n = 1504


septic_patients %>%
  group_by(hospital_id) %>%
  summarise(cipro_p = portion_S(cipr, as_percent = TRUE),
            cipro_n = n_rsi(cipr),
            genta_p = portion_S(gent, as_percent = TRUE),
            genta_n = n_rsi(gent),
            combination_p = portion_S(cipr, gent, as_percent = TRUE),
            combination_n = n_rsi(cipr, gent))

# Get portions S/I/R immediately of all rsi columns
septic_patients %>%
  select(amox, cipr) %>%
  portion_df(translate = FALSE)

# It also supports grouping variables
septic_patients %>%
  select(hospital_id, amox, cipr) %>%
  group_by(hospital_id) %>%
  portion_df(translate = FALSE)


## Not run: 
##D 
##D # calculate current empiric combination therapy of Helicobacter gastritis:
##D my_table %>%
##D   filter(first_isolate == TRUE,
##D          genus == "Helicobacter") %>%
##D   summarise(p = portion_S(amox, metr),  # amoxicillin with metronidazole
##D             n = n_rsi(amox, metr))
## End(Not run)



