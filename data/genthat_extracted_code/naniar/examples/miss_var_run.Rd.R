library(naniar)


### Name: miss_var_run
### Title: Find the number of missing and complete values in a single run
### Aliases: miss_var_run

### ** Examples


miss_var_run(pedestrian, hourly_counts)

library(dplyr)

# find the number of runs missing/complete for each month

pedestrian %>%
  group_by(month) %>%
  miss_var_run(hourly_counts)

library(ggplot2)

# explore the number of missings in a given run
miss_var_run(pedestrian, hourly_counts) %>%
  filter(is_na == "missing") %>%
  count(run_length) %>%
  ggplot(aes(x = run_length,
             y = n)) +
      geom_col()

# look at the number of missing values and the run length of these.
miss_var_run(pedestrian, hourly_counts) %>%
  ggplot(aes(x = is_na,
             y = run_length)) +
      geom_boxplot()

# using group_by
 pedestrian %>%
   group_by(month) %>%
   miss_var_run(hourly_counts)





