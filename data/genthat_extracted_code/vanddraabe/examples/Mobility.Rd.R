library(vanddraabe)


### Name: Mobility
### Title: Water Molecule Mobility
### Aliases: Mobility

### ** Examples

  set.seed(13)
  sample.idc <- sample(1:nrow(thrombin.1hai$atom), 10)
  Bvalues <- thrombin.1hai$atom[sample.idc, "b"]
  Bvalues
  # [1] 32.53 22.36 24.91 42.11 36.60
  #     54.66 37.71 14.93 27.65 17.84
  occupancy <- thrombin.1hai$atom[sample.idc, "o"]
  occupancy
  # [1] 1.00 1.00 1.00 1.00 0.79
  #     1.00 1.00 1.00 1.00 1.00
  Mobility(Bvalues, occupancy)
  # [1] 1.0230 0.7032 0.7834 1.3243 1.4570
  #     1.7190 1.1859 0.4695 0.8696 0.5610




