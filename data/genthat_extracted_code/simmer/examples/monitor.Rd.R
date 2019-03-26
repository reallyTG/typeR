library(simmer)


### Name: monitor
### Title: Create a Monitor
### Aliases: monitor monitor_mem monitor_delim monitor_csv

### ** Examples

mon <- monitor_csv()
mon

env <- simmer(mon=mon) %>%
  add_generator("dummy", trajectory() %>% timeout(1), function() 1) %>%
  run(10)
env

read.csv(mon$handlers$arrivals) # direct access
get_mon_arrivals(env)           # adds the "replication" column




