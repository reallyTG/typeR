library(AMR)


### Name: count
### Title: Count isolates
### Aliases: count count_R count_IR count_I count_SI count_S count_df
### Keywords: antibiotics isolate isolates resistance rsi susceptibility

### ** Examples

# septic_patients is a data set available in the AMR package. It is true, genuine data.
?septic_patients

# Count resistant isolates
count_R(septic_patients$amox)
count_IR(septic_patients$amox)

# Or susceptibile isolates
count_S(septic_patients$amox)
count_SI(septic_patients$amox)

# Since n_rsi counts available isolates, you can
# calculate back to count e.g. non-susceptible isolates.
# This results in the same:
count_IR(septic_patients$amox)
portion_IR(septic_patients$amox) * n_rsi(septic_patients$amox)

library(dplyr)
septic_patients %>%
  group_by(hospital_id) %>%
  summarise(R = count_R(cipr),
            I = count_I(cipr),
            S = count_S(cipr),
            n = n_rsi(cipr), # the actual total; sum of all three
            total = n())     # NOT the amount of tested isolates!

# Count co-resistance between amoxicillin/clav acid and gentamicin,
# so we can see that combination therapy does a lot more than mono therapy.
# Please mind that `portion_S` calculates percentages right away instead.
count_S(septic_patients$amcl)   # S = 1056 (67.3%)
n_rsi(septic_patients$amcl)     # n = 1570

count_S(septic_patients$gent)   # S = 1363 (74.0%)
n_rsi(septic_patients$gent)     # n = 1842

with(septic_patients,
     count_S(amcl, gent))       # S = 1385 (92.1%)
with(septic_patients,           # n = 1504
     n_rsi(amcl, gent))

# Get portions S/I/R immediately of all rsi columns
septic_patients %>%
  select(amox, cipr) %>%
  count_df(translate = FALSE)

# It also supports grouping variables
septic_patients %>%
  select(hospital_id, amox, cipr) %>%
  group_by(hospital_id) %>%
  count_df(translate = FALSE)




