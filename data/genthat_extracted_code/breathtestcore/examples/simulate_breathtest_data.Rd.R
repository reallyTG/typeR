library(breathtestcore)


### Name: simulate_breathtest_data
### Title: Simulate 13C breath time series data
### Aliases: simulate_breathtest_data

### ** Examples

library(ggplot2)
pdr = simulate_breathtest_data(n_records = 4, seed = 4711, missing = 0.3,
       student_t_df = 2, noise = 1.5) # Strong outliers
#
str(pdr, 1)  
#
pdr$record # The "correct" parameters
#
# Explicit plotting
ggplot(pdr$data, aes(x = minute, y = pdr)) + geom_point() +
  facet_wrap(~patient_id) + ggtitle(comment(pdr$data))
#
# Or use cleanup_data and null_fit for S3 plotting
plot(null_fit(cleanup_data(pdr$data)))



