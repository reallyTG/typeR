library(servosphereR)


### Name: mergeTrialInfo
### Title: Merge trial id information
### Aliases: mergeTrialInfo

### ** Examples

 servosphere <- list(data.frame(id = rep(1, 200),
                                stimulus = rep(c(0, 1), each = 100),
                                dT = sample(8:12, 200, replace = TRUE),
                                dx = runif(200, 0, 5),
                                dy = runif(200, 0, 5),
                                treatment = rep("a", 200),
                                date = rep("2032018", 200)),
                     data.frame(id = rep(2, 200),
                                stimulus = rep(c(0, 1), each = 100),
                                dT = sample(8:12, 200, replace = TRUE),
                                dx = runif(200, 0, 5),
                                dy = runif(200, 0, 5),
                                treatment = rep("b", 200),
                                date = rep("2032018", 200)))
 trial_record <- data.frame(id = c(1, 2),
                            treatment = c("a", "b"),
                            date = c("2032018", "2042018"),
                            time = c("13:30", "07:30"))
 trial_id_split <- data.frame(id = c(1, 2, 1, 2),
                              stimulus = c(1, 1, 2, 2),
                              treatment = c("a", "b", "a", "b"),
                              date = rep(c("2032018", "2042018"), times = 2),
                              time = rep(c("13:30", "07:30"), times = 2),
                              id_stim = c("1_1", "2_1", "1_2", "2_2"))
# Merge the columns id, treatment, and date from the trial_record data frame
# with all the data frames in our list servosphere.

 merged_servosphere <- mergeTrialInfo(servosphere,
   trial_record,
   col.names = c("id", "treatment"),
   stimulus.keep = c(0, 1))

# Repeat of the merger above without retaining the id column while
# also splitting the data provided into separate data frames based on the
# different stimuli recorded, keeping only data associated with stimuli 1 and
# 2. Splitting based on stimulus requires a column in the trial.data data
# frame titled id_stim.

 merged_servosphere <- mergeTrialInfo(servosphere,
     trial_id_split,
     col.names = c("id", "treatment"),
     stimulus.split = TRUE,
     stimulus.keep = c(0, 1))



