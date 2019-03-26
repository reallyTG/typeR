library(scuba)


### Name: oxtox
### Title: Pulmonary Oxygen Toxicity
### Aliases: oxtox
### Keywords: utilities

### ** Examples

  # Nitrox II (36% oxygen) at 30 metres for 27 minutes
  d <- dive(nitrox(0.36), c(30,27))
  oxtox(d)

  # Same as above, followed by safety stop on 100% oxygen 
  d <- dive(nitrox(0.36), c(30,27),5, nitrox(1), c(5,5))
  oxtox(d)



