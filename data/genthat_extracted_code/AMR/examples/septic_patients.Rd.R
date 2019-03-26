library(AMR)


### Name: septic_patients
### Title: Data set with 2000 blood culture isolates of septic patients
### Aliases: septic_patients
### Keywords: datasets

### ** Examples

# ----------- #
# PREPARATION #
# ----------- #

# Save this example data set to an object, so we can edit it:
my_data <- septic_patients

# load the dplyr package to make data science A LOT easier
library(dplyr)

# Add first isolates to our data set:
my_data <- my_data %>%
  mutate(first_isolates = first_isolate(my_data, "date", "patient_id", "mo"))

# -------- #
# ANALYSIS #
# -------- #

# 1. Get the amoxicillin resistance percentages (p)
#     and numbers (n) of E. coli, divided by hospital:

my_data %>%
  filter(mo == guess_mo("E. coli"),
         first_isolates == TRUE) %>%
  group_by(hospital_id) %>%
  summarise(n = n_rsi(amox),
            p = portion_IR(amox))


# 2. Get the amoxicillin/clavulanic acid resistance
#    percentages of E. coli, trend over the years:

my_data %>%
  filter(mo == guess_mo("E. coli"),
         first_isolates == TRUE) %>%
  group_by(year = format(date, "%Y")) %>%
  summarise(n = n_rsi(amcl),
            p = portion_IR(amcl, minimum = 20))



