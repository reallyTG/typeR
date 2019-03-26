library(clinfun)


### Name: toxbdry
### Title: Stopping rule for toxicity monitoring
### Aliases: toxbdry bdrycross.prob print.toxbdry
### Keywords: design

### ** Examples

  toxbdry(0.2, 0.35, c(20,40,60,75))
  toxbdry(0.2, 0.3, c(20,40,60,75), cP0=0.15, cP1=0.8)
  # continuous monitoring
  toxbdry(0.1, 0.3, 2:30)
  # prioritize cP1 error threshold
  toxbdry(0.1, 0.3, 2:25, priority="alt")



