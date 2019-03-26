library(prepdat)


### Name: prep
### Title: Creates One Finalized Table Ready for Statistical Analysis
### Aliases: prep

### ** Examples

data(stroopdata)
finalized_stroopdata <- prep(
           dataset = stroopdata
           , file_name = NULL
           , file_path = NULL
           , id = "subject"
           , within_vars = c("block", "target_type")
           , between_vars = c("order")
           , dvc = "rt"
           , dvd = "ac"
           , keep_trials = NULL
           , drop_vars = c()
           , keep_trials_dvc = "raw_data$rt > 100 & raw_data$rt < 3000 & raw_data$ac == 1"
           , keep_trials_dvd = "raw_data$rt > 100 & raw_data$rt < 3000"
           , id_properties = c()
           , sd_criterion = c(1, 1.5, 2)
           , percentiles = c(0.05, 0.25, 0.75, 0.95)
           , outlier_removal = 2
           , keep_trials_outlier = "raw_data$ac == 1"
           , decimal_places = 0
           , notification = TRUE
           , dm = c()
           , save_results = FALSE
           , results_name = "results.txt"
           , results_path = NULL
           , save_summary = FALSE
         )




