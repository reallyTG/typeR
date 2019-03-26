library(BioGeoBEARS)


### Name: calc_obs_like
### Title: Calculate likelihood of count data given true presence/absence
###   and parameters
### Aliases: calc_obs_like

### ** Examples

# Example: 10 observations of the species mean dramatically higher likelihood of the
# data on the hypothesis that it is truly present.

# With zero error rate
obs_target_species = 10
obs_all_species = 100
mean_frequency=0.1
dp=1
fdp=0
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence
# Note that the probability of getting detections, under the hypothesis of
# true absence, is -Inf


# With a small error rate, there is some small but positive probability of
# falsely getting 10 detections
obs_target_species = 10
obs_all_species = 100
mean_frequency=0.1
dp=0.99
fdp=0.001
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence
# i.e. the prob. of the data is 1 under the hypothesis of presence, and 0
# under the hypothesis of absence (ln(prob) = 0 & -Inf, respectively)


# Note that with very high error rates, your conclusion could reverse
obs_target_species = 10
obs_all_species = 100
mean_frequency=0.1
dp=0.5
fdp=0.3
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence


# Example #2 -- what if you have ZERO detections, but lots of detections
# of your taphonomic control?
obs_target_species = 0
obs_all_species = 1
mean_frequency=0.1
dp=1
fdp=0
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence

# With a slight error rate
obs_target_species = 0
obs_all_species = 1
mean_frequency=0.1
dp=0.99
fdp=0.001
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence


obs_target_species = 0
obs_all_species = 2
mean_frequency=0.1
dp=1
fdp=0
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence

# With a slight error rate
obs_target_species = 0
obs_all_species = 2
mean_frequency=0.1
dp=0.99
fdp=0.001
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence





# Example #3 -- what if you have ZERO detections, but only a few
# detections of your taphonomic control?
obs_target_species = 0
obs_all_species = 100
mean_frequency=0.1
dp=1
fdp=0
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence

# With a slight error rate
obs_target_species = 0
obs_all_species = 100
mean_frequency=0.1
dp=0.99
fdp=0.001
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence



# Special cases -- e.g., no data
# Prob(data)=1, ln(prob)=0
obs_target_species = 0
obs_all_species = 0
mean_frequency=0.1
dp=0.99
fdp=0.001
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence

obs_target_species = 0
obs_all_species = 0
mean_frequency=0.1
dp=1
fdp=0
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence


# What if, for some reason, you put in identical detections and taphonomic control
# counts? (e.g., you load in a standard tipranges file)
obs_target_species = 1
obs_all_species = 1
mean_frequency=1
dp=1
fdp=0
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence

# What if, for some reason, you put in identical detections and taphonomic control
# counts? (e.g., you load in a standard tipranges file)
obs_target_species = 1
obs_all_species = 1
mean_frequency=1
dp=0.99
fdp=0.001
LnL_under_presence = calc_obs_like(truly_present=TRUE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_absence = calc_obs_like(truly_present=FALSE, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
LnL_under_presence
LnL_under_absence



