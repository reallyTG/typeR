library(AMR)


### Name: key_antibiotics
### Title: Key antibiotics for first _weighted_ isolates
### Aliases: key_antibiotics key_antibiotics_equal

### ** Examples

# septic_patients is a dataset available in the AMR package
?septic_patients
my_patients <- septic_patients

library(dplyr)
# set key antibiotics to a new variable
my_patients <- my_patients %>%
  mutate(keyab = key_antibiotics(.)) %>%
  mutate(
    # now calculate first isolates
    first_regular = first_isolate(., "date", "patient_id", "mo"),
    # and first WEIGHTED isolates
    first_weighted = first_isolate(., "date", "patient_id", "mo",
                                   col_keyantibiotics = "keyab")
  )

# Check the difference, in this data set it results in 7% more isolates:
sum(my_patients$first_regular, na.rm = TRUE)
sum(my_patients$first_weighted, na.rm = TRUE)


# output of the `key_antibiotics` function could be like this:
strainA <- "SSSRR.S.R..S"
strainB <- "SSSIRSSSRSSS"

key_antibiotics_equal(strainA, strainB)
# TRUE, because I is ignored (as are missing values)

key_antibiotics_equal(strainA, strainB, ignore_I = FALSE)
# FALSE, because I is not ignored and so the 4th value differs



