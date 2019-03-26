library(zebu)


### Name: subgroups
### Title: Local Association Subgroup Analysis
### Aliases: subgroups

### ** Examples

# In this example, we will use the zebu 'trial' dataset.
# See vignette example for more detailed explanation

# 'trial' corresponds to a simulated clinical trial where patient recovery
# is dependent on drug intake ('drug') and resistance status ('resistance').
# Patient recovery is monitored by a biomarker (continuous variable from 0 to 1)
# Patients with post-treatment biomarker ('postbiom') above 0.7 is have recovered.

# Load 'trial' dataset
data(trial)

# Compute the association between drug intake and patient recovery
las <- lassie(trial,
              select = c("drug", "postbiom"),
              continuous = c("postbiom"),
              breaks = c(0, 0.7, 1))

# Permuation test
# Access significance of global and local association
las <- permtest(las)

# Global association between drug intake and recovery but not for all patients
# Being in the drug group is locally independent of having not recovered
print(las)

# Local association subgroup analysis
sub <- subgroups(las, trial, select = "resistance", alpha = 0.01)

# Variable 'resistance' explains differences between sensitive and resistance patients
print(sub)




