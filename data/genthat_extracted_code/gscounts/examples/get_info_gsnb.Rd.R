library(gscounts)


### Name: get_info_gsnb
### Title: Information level for log rate ratio
### Aliases: get_info_gsnb

### ** Examples

# Calculates information level for case of 10 subjects per group
# Follow-up times of subjects in each group range from 1 to 3
get_info_gsnb(rate1 = 0.1,
              rate2 = 0.125,
              dispersion = 4, 
              followup1 = seq(1, 3, length.out = 10), 
              followup2 = seq(1, 3, length.out = 10))



