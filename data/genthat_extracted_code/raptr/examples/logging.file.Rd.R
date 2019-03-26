library(raptr)


### Name: logging.file
### Title: Log file
### Aliases: logging.file logging.file.RapResults logging.file.RapSolved

### ** Examples

# load data
data(sim_rs)

# log file for the best solution
cat(logging.file(sim_rs, 0))

# log file for the second solution
cat(logging.file(sim_rs, 2))

# log files for all solutions
cat(logging.file(sim_rs, NULL))




