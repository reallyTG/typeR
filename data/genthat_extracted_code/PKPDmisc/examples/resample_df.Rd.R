library(PKPDmisc)


### Name: resample_df
### Title: resampling
### Aliases: resample_df

### ** Examples

library(PKPDmisc)
library(dplyr, quiet = TRUE)

# simple example resampling by ID maintaining Gender distribution, with 10 individuals
resample_df(sd_oral_richpk, key_cols = "ID", strat_cols = "Gender", n = 10)

# for a more complex example lets resample "simulated" data with multiple replicates
subset_data <- sd_oral_richpk %>%
   filter(ID < 20)
   
# make 'simulated' data with 5 replicates and combine to single dataframe
rep_dat <- lapply(1:5, function(x) {
subset_data %>% 
  mutate(REP = x)
  }) %>% bind_rows()

# now when we resample we also want to maintain the ID+REP relationship as resampling
# just the ID would give all rows associated for an ID with all reps, rather than 
# a single "unit" of ID/REP
resample_df(rep_dat, key_cols = c("ID", "REP"))

# check to see that stratification is maintained
rep_dat %>% group_by(Gender) %>% tally
resample_df(rep_dat, key_cols=c("ID", "REP"), strat_cols="Gender") %>%
  group_by(Gender) %>% tally
  
rep_dat %>% group_by(Gender, Race) %>% tally

resample_df(rep_dat, key_cols=c("ID", "REP"), strat_cols=c("Gender", "Race")) %>%
  group_by(Gender, Race) %>% tally



