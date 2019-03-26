library(BioGeoBEARS)


### Name: prob_of_states_from_prior_prob_areas
### Title: Calculate probability of detection data for each OTU at each
###   range in a list of states/geographic ranges
### Aliases: prob_of_states_from_prior_prob_areas

### ** Examples

testval=1

prior_prob_presence = 0.01

areas = c("K", "O", "M", "H")
numareas = length(areas)
states_list_0based_index =
rcpp_areas_list_to_states_list(areas=areas, maxareas=4, include_null_range=TRUE)
states_list_0based_index
numareas = 4

mean_frequency=0.1
dp=1
fdp=0

prob_of_states_from_prior_prob_areas(states_list_0based_index, numareas=numareas,
prior_prob_presence=prior_prob_presence, null_range_gets_0_prob=TRUE,
normalize_probs=TRUE)

prob_of_states_from_prior_prob_areas(states_list_0based_index, numareas=numareas,
prior_prob_presence=prior_prob_presence, null_range_gets_0_prob=TRUE,
normalize_probs=FALSE)

prob_of_states_from_prior_prob_areas(states_list_0based_index, numareas=numareas,
prior_prob_presence=prior_prob_presence, null_range_gets_0_prob=FALSE,
normalize_probs=TRUE)

prob_of_states_from_prior_prob_areas(states_list_0based_index, numareas=numareas,
prior_prob_presence=prior_prob_presence, null_range_gets_0_prob=FALSE,
normalize_probs=FALSE)



