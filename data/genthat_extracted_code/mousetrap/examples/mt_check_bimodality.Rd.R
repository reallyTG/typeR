library(mousetrap)


### Name: mt_check_bimodality
### Title: Assess bimodality of mouse-tracking measure distributions.
### Aliases: mt_check_bimodality

### ** Examples

# Calculate measures
mt_example <- mt_measures(mt_example)

# Assess bimodality for untransformed variables
mt_check_bimodality(mt_example,
  use_variables=c("MAD", "AD"))

# Standardize variables per participant
mt_example <- mt_standardize(mt_example,
  use_variables=c("MAD", "AD"), within="subject_nr")
  
# Assess bimodality for standardized variables
mt_check_bimodality(mt_example,
  use_variables=c("z_MAD", "z_AD"))

# Assess bimodality with simulated p values for HDS
mt_check_bimodality(mt_example,
  use_variables=c("z_MAD", "z_AD"),
  methods=c("BC", "HDS_sim"))
 
# Assess bimodality per condition
mt_check_bimodality(mt_example,
  use_variables=c("z_MAD", "z_AD"),
  grouping_variables="Condition")
                    



