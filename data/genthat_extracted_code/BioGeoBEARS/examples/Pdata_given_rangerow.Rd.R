library(BioGeoBEARS)


### Name: Pdata_given_rangerow
### Title: Calculate probability of detection data given a true geographic
###   range and a detection probability
### Aliases: Pdata_given_rangerow

### ** Examples

testval=1

# soft-coded input files
extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
detects_fn = np(paste(extdata_dir, "/Psychotria_detections_v1.txt", sep=""))
controls_fn = np(paste(extdata_dir, "/Psychotria_controls_v1.txt", sep=""))

OTUnames=NULL
areanames=NULL
tmpskip=0

detects_df = read_detections(detects_fn, OTUnames=NULL, areanames=NULL, tmpskip=0)
controls_df = read_controls(controls_fn, OTUnames=NULL, areanames=NULL, tmpskip=0)

detects_df
controls_df
detects_df / controls_df

mean_frequency=0.1
dp=1
fdp=0

mapply_calc_obs_like(truly_present=TRUE, obs_target_species=detects_df,
obs_all_species=controls_df, mean_frequency, dp, fdp)

mapply_calc_obs_like(truly_present=FALSE, obs_target_species=detects_df,
obs_all_species=controls_df, mean_frequency, dp, fdp)

mapply_calc_post_prob_presence(prior_prob_presence=0.01,
obs_target_species=detects_df,
obs_all_species=controls_df, mean_frequency, dp, fdp)



# Now, calculate the likelihood of the data given a geographic range
numareas = 4
tmpranges = list(c(0), c(1), c(0,1))
truerange_areas = tmpranges[[3]]
truerange_areas


# Build a TRUE/FALSE row specifying the ranges in this assumed true
# state/geographic range
range_as_areas_TF = matrix(data=FALSE, nrow=1, ncol=numareas)
range_as_areas_TF[truerange_areas+1] = TRUE
range_as_areas_TF

detects_df_row = detects_df[1,]
controls_df_row = controls_df[1,]

# Manual method, superceded by Pdata_given_rangerow():
# LnLs_of_data_in_each_area = mapply(FUN=calc_obs_like,
# obs_target_species=detects_df_row,
# obs_all_species=controls_df_row, truly_present=range_as_areas_TF,
# MoreArgs=list(mean_frequency=mean_frequency, dp=dp, fdp=fdp),
# USE.NAMES=TRUE)


# Calculate data likelihoods on for this geographic range
mean_frequency=0.1
dp=1
fdp=0

# Get the likelihood (the probability of the data, given this range)
likelihood_of_data_given_range = Pdata_given_rangerow(
range_as_areas_TF=range_as_areas_TF,
detects_df_row=detects_df_row,
controls_df_row=controls_df_row, mean_frequency=mean_frequency, dp=dp, fdp=fdp)
likelihood_of_data_given_range

# Return the raw log-likelihoods:
LnLs_of_data_in_each_area = Pdata_given_rangerow(range_as_areas_TF=range_as_areas_TF,
detects_df_row=detects_df_row,
controls_df_row=controls_df_row, mean_frequency=mean_frequency, dp=dp, fdp=fdp,
return_LnLs=TRUE)

detects_df_row
controls_df_row
LnLs_of_data_in_each_area

# The likelihood: the probability of the data in each area:
exp(LnLs_of_data_in_each_area)



