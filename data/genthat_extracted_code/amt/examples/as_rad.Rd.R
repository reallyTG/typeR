library(amt)


### Name: as_rad
### Title: Converts angles to radians
### Aliases: as_rad

### ** Examples

as_rad(seq(-180, 180, 30))

# The default unit of turning angles is degrees.
data(deer)
deer %>% steps() %>% mutate(ta_ = as_rad(ta_))



