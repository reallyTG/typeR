library(taxa)


### Name: select_obs
### Title: Subset columns in a 'taxmap()' object
### Aliases: select_obs

### ** Examples

# Selecting a column by name
select_obs(ex_taxmap, "info", dangerous)

# Selecting a column by index
select_obs(ex_taxmap, "info", 3)

# Selecting a column by regular expressions
select_obs(ex_taxmap, "info", matches("^n"))




