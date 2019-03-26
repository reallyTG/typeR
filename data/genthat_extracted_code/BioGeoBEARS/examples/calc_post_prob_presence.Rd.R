library(BioGeoBEARS)


### Name: calc_post_prob_presence
### Title: Calculate posterior probability of presence, given count data
###   and parameters
### Aliases: calc_post_prob_presence

### ** Examples

# Calculate posterior probability of presence in an area,
# given a dp (detection probability) and detection model.

# With zero error rate
obs_target_species = 10
obs_all_species = 100
mean_frequency=0.1
dp=1
fdp=0
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob
# i.e., with perfect detection, the prob. of presence is 1 under the
# hypothesis of presence, and 0 under the hypothesis of
# (This is because the likelihood of the data under
# presence and absence are ln(prob) = 0 & -Inf, respectively.)


# Note that with very high error rates, your conclusion could reverse
obs_target_species = 10
obs_all_species = 100
mean_frequency=0.1
dp=0.5
fdp=0.3
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob


# With 0 error rate, even 1 observation makes P(presence) = 1
obs_target_species = 1
obs_all_species = 100
mean_frequency=0.1
dp=1
fdp=0
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob


# With a small error rate, there is some small but positive probability of
# falsely getting 10 detections; but it may be effectively 0
obs_target_species = 10
obs_all_species = 100
mean_frequency=0.1
dp=0.99
fdp=0.001
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob


# If you have only 1 detection, and you have 100 taphonomic controls and
# a mean_frequency of sampling the OTU of interest of 0.1, then there is
# still a very low probability of presence (since, under your model,
# you should expect to see about 10 detections, not 1)
obs_all_species = 100
mean_frequency=0.1
dp=0.99
fdp=0.001
prior_prob_presence = 0.01

obs_target_species = 0
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 1
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 2
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 3
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)



# Note how quickly this chances if you drop the mean_frequency from 0.1
# to 0.01. This means that if you want single detections to count for
# a lot, you need either a low mean_frequency which matches the observed
# frequency, or an extremely high/perfect detection probability (dp).
obs_all_species = 100
mean_frequency=0.01
dp=0.99
fdp=0.001
prior_prob_presence = 0.01

obs_target_species = 0
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 1
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 2
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 3
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)


# Changing mean_frequency from 0.01 to 0.001 actually LOWERS the posterior
# probability of presence based on 1 detection, as we have a somewhat
# significant false detection rate:
obs_target_species = 1
obs_all_species = 100
mean_frequency=0.001
dp=0.99
fdp=0.001
prior_prob_presence = 0.01

obs_target_species = 0
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 1
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 2
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 3
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)


# Change false detection probability to a much lower value
obs_all_species = 100
mean_frequency=0.001
dp=0.99
fdp=0.00001
prior_prob_presence = 0.01

obs_target_species = 0
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 1
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 2
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 3
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)




# Change false detection probability to 0
obs_all_species = 100
mean_frequency=0.001
dp=0.99
fdp=0.0
prior_prob_presence = 0.01


obs_target_species = 0
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 1
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 2
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 3
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)









# Change mean_frequency to 0.001
obs_all_species = 100
mean_frequency=0.001
dp=0.99
fdp=0.0
prior_prob_presence = 0.01

obs_target_species = 0
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 1
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 2
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)

obs_target_species = 3
calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)







# Example #2 -- what if you have ZERO detections, but lots of detections
# of your taphonomic control?
obs_target_species = 0
obs_all_species = 100
mean_frequency=0.1
dp=1
fdp=0
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob

# With a slight error rate
obs_target_species = 0
obs_all_species = 100
mean_frequency=0.1
dp=0.99
fdp=0.001
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob


obs_target_species = 0
obs_all_species = 2
mean_frequency=0.1
dp=1
fdp=0
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob

# With a slight error rate
obs_target_species = 0
obs_all_species = 2
mean_frequency=0.1
dp=0.99
fdp=0.001
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob





# Example #3 -- what if you have ZERO detections, but only a few
# detections of your taphonomic control?
obs_target_species = 0
obs_all_species = 1
mean_frequency=0.1
dp=1
fdp=0
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob

# With a slight error rate
obs_target_species = 0
obs_all_species = 1
mean_frequency=0.1
dp=0.99
fdp=0.001
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob



# Special cases -- e.g., no data
# Prob(data)=1, ln(prob)=0
obs_target_species = 0
obs_all_species = 0
mean_frequency=0.1
dp=0.99
fdp=0.001
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob

obs_target_species = 0
obs_all_species = 0
mean_frequency=0.1
dp=1
fdp=0
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob


# What if, for some reason, you put in identical detections and taphonomic control
# counts? (e.g., you load in a standard tipranges file)
obs_target_species = 1
obs_all_species = 1
mean_frequency=1
dp=1
fdp=0
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob

# What if, for some reason, you put in identical detections and taphonomic control
# counts? (e.g., you load in a standard tipranges file)
obs_target_species = 1
obs_all_species = 1
mean_frequency=1
dp=0.99
fdp=0.001
prior_prob_presence = 0.01
post_prob = calc_post_prob_presence(prior_prob_presence, obs_target_species,
obs_all_species, mean_frequency, dp, fdp)
post_prob



