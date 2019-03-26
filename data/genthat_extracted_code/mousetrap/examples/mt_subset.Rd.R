library(mousetrap)


### Name: mt_subset
### Title: Filter mousetrap data.
### Aliases: mt_subset

### ** Examples

# Subset based on trial data
mt_example_atypical <- mt_subset(mt_example, Condition=="Atypical")

# Subset based on mouse-tracking measure (MAD)
mt_example <- mt_measures(mt_example)
mt_example_mad_sub <- mt_subset(mt_example, MAD<400, check="measures")




