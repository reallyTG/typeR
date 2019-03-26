library(ipumsr)


### Name: set_ipums_var_attributes
### Title: Add IPUMS variable attributes to a data.frame
### Aliases: set_ipums_var_attributes

### ** Examples

  ddi_file <- ipums_example("cps_00006.xml")
  ddi <- read_ipums_ddi(ddi_file)
  cps <- read_ipums_micro(ddi, var_attrs = NULL) # Don't load with attributes

  ipums_var_desc(cps$YEAR) # Not available

  # But, we can add on attributes after loading
  cps_with_attr <- set_ipums_var_attributes(cps, ddi)
  ipums_var_desc(cps_with_attr$YEAR)




