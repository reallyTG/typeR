library(mousetrap)


### Name: mt_standardize
### Title: Standardize mouse-tracking measures per level of other
###   variables.
### Aliases: mt_standardize

### ** Examples

mt_example <- mt_measures(mt_example)

# Standardize MAD and AD per subject
mt_example <- mt_standardize(mt_example,
  use_variables=c("MAD", "AD"),
  within="subject_nr", prefix="z_")

# Standardize MAD and AD per subject and Condition
mt_example <- mt_standardize(mt_example,
  use_variables=c("MAD", "AD"),
  within=c("subject_nr", "Condition"),
  prefix="z_")
  



