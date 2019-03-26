library(ipumsr)


### Name: read_ipums_micro_yield
### Title: Read data from an IPUMS extract (in yields)
### Aliases: read_ipums_micro_yield read_ipums_micro_list_yield
###   IpumsLongYield IpumsListYield
### Keywords: datasets

### ** Examples

# An example using "long" data
long_yield <- read_ipums_micro_yield(ipums_example("cps_00006.xml"))
# Get first 10 rows
long_yield$yield(10)
# Get 20 more rows now
long_yield$yield(20)
# See what row we're on now
long_yield$cur_pos
# Reset to beginning
long_yield$reset()
# Read the whole thing in chunks and count Minnesotans
total_mn <- 0
while (!long_yield$is_done()) {
  cur_data <- long_yield$yield(1000)
  total_mn <- total_mn + sum(as_factor(cur_data$STATEFIP) == "Minnesota")
}
total_mn

# Can also read hierarchical data as list:
list_yield <- read_ipums_micro_list_yield(ipums_example("cps_00006.xml"))
list_yield$yield(10)




