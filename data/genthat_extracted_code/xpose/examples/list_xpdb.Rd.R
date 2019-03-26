library(xpose)


### Name: list_xpdb
### Title: List available datasets
### Aliases: list_xpdb list_data list_files list_special

### ** Examples

# List output tables data
list_data(xpdb_ex_pk)

# List output files data
list_files(xpdb_ex_pk)

# List special data
xpdb_ex_pk %>% 
vpc_data(quiet = TRUE) %>% 
list_special()




