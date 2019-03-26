library(xpose)


### Name: subset_xpdb
### Title: Subset datasets in an xpdb
### Aliases: subset_xpdb filter.xpose_data slice.xpose_data
###   distinct.xpose_data

### ** Examples

# Subset by condition
xpdb_ex_pk %>% 
 filter(DV < 1, .problem = 1) %>% 
 dv_vs_ipred()
  
# Subset by positions
xpdb_ex_pk %>% 
 slice(1:100, .problem = 1) %>% 
 dv_vs_ipred()
 
# Deduplicate rows
xpdb_ex_pk %>% 
 distinct(TIME, .problem = 1) %>% 
 dv_vs_ipred()



