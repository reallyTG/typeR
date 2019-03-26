library(amt)


### Name: convert_angles
### Title: Converts angles to radians
### Aliases: convert_angles as_rad as_degree

### ** Examples

as_rad(seq(-180, 180, 30))

# The default unit of turning angles is rad.
data(deer)
deer %>% steps() %>% mutate(ta_ = as_degree(ta_))



