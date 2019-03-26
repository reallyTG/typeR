library(ipumsr)


### Name: ipums_var_info
### Title: Get IPUMS variable information
### Aliases: ipums_var_info ipums_var_desc ipums_var_label ipums_val_labels

### ** Examples

ddi <- read_ipums_ddi(ipums_example("cps_00006.xml"))

ipums_var_info(ddi)
ipums_var_desc(ddi, MONTH)
ipums_var_label(ddi, MONTH)
ipums_val_labels(ddi, MONTH)




