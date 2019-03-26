library(INDperform)


### Name: find_id
### Title: Extracts the IND~pressure IDs in the tibble.
### Aliases: find_id

### ** Examples

# Using the Baltic Sea demo data:
# Look for specific INDs in combination with every pressure
ind_name <- c("TZA","MS")
find_id(model_gam_ex, ind_name)$id
# Look for specific IND~pressure combinations
press_name <- c("Tsum", "Swin")
find_id(model_gam_ex, ind_name, press_name)
# Look for specific pressures in combination with every IND
find_id(model_gam_ex, press_name = press_name)



