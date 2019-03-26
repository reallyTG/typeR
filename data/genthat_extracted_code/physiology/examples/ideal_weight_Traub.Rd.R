library(physiology)


### Name: ideal_weight_Traub
### Title: ideal weight for child per Traub
### Aliases: ideal_weight_Traub

### ** Examples

# will warn if given age is not in validate range from publication:
## Not run: 
##D   ideal_weight_child(height_m = 0.5, age_y = 0, do_warn = TRUE)
##D   ideal_weight_child(0.8, age_y = 11 / 12, do_warn = TRUE)
##D   ideal_weight_child(0.5, age_y = 25/365, do_warn = TRUE)
## End(Not run)
  ideal_weight_child(0.5, age_y = 25 / 365, do_warn = FALSE)
  ideal_weight_child(1, age_y = 2)



