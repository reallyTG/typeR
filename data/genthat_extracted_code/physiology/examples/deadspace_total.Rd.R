library(physiology)


### Name: deadspace_total
### Title: Estimate ventilation dead-space
### Aliases: deadspace_total deadspace_anatomic deadspace_anatomic_adult
###   deadspace_anatomic_child deadspace_intrathoracic_ml

### ** Examples

  height <- seq(1, 2, 0.05)
  male <- rep(FALSE, length(height))
  iw <- ideal_weight_adult(height_m = height, male = male)
  ## Not run: 
##D   plot(iw, deadspace_anatomic_adult(ideal_weight_kg = height))
##D   
## End(Not run)

  # discontinuity at age 6 is driven by ideal weight more than the
  # lograithmic calculation
  iw <- c(seq(12, 18, 0.2), seq(18.5, 24, 0.5))
  youngest = 3
  oldest = 9
  ages <- seq(youngest, oldest, (oldest - youngest) / (length(iw) - 1))
  ## Not run: 
##D   plot(iw, deadspace_anatomic_child(ideal_weight_kg = iw, age_y = ages),
##D        type = "l")
##D   
## End(Not run)



