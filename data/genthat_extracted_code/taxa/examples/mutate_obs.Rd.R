library(taxa)


### Name: mutate_obs
### Title: Add columns to 'taxmap()' objects
### Aliases: mutate_obs

### ** Examples


# Add column to existing tables
mutate_obs(ex_taxmap, "info",
           new_col = "Im new",
           newer_col = paste0(new_col, "er!"))

# Create columns in a new table
mutate_obs(ex_taxmap, "new_table",
           nums = 1:10,
           squared = nums ^ 2)

# Add a new vector
mutate_obs(ex_taxmap, "new_vector", 1:10)

# Add a new list
mutate_obs(ex_taxmap, "new_list", list(1, 2))




