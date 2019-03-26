library(easyalluvial)


### Name: manip_bin_numerics
### Title: bin numerical columns
### Aliases: manip_bin_numerics

### ** Examples

summary( mtcars )
summary( manip_bin_numerics(mtcars) )
summary( manip_bin_numerics(mtcars, bin_labels = 'mean'))
summary( manip_bin_numerics(mtcars, bin_labels = 'cuts'
  , scale = FALSE, center = FALSE, transform = FALSE))



