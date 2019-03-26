library(biogas)


### Name: mass2vol
### Title: Calculate Biogas Production Gravimetrically
### Aliases: mass2vol
### Keywords: manip

### ** Examples

  # Volume of methane if measured mass loss was 3.1 g
  mass2vol(3.1, xCH4 = 0.65, temp = 35, pres = 1)

  # More details
  mass2vol(3.1, xCH4 = 0.65, temp = 35, pres = 1, value = "all")
  
  # Vectorized
  data("massw")
  massw$massloss <- massw$start - massw$end
  massw$vCH4 <- mass2vol(massw$massloss, xCH4 = 0.65, temp = 35, 
                         pres = 1)
  massw
  



