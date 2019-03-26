library(vanddraabe)


### Name: NormalizedBvalue
### Title: B-value Normalization
### Aliases: NormalizedBvalue

### ** Examples

  set.seed(13)
  Bvalues <- sample(thrombin.1hai$atom$b, 10)
  Bvalues
  # [1] 32.53 22.36 24.91 42.11 36.60
  #     54.66 37.71 14.93 27.65 17.84
  NormalizedBvalue(Bvalues)
  # [1]  0.1158 -0.7252 -0.5143  0.9080  0.4523
  #      1.9457  0.5441 -1.3396 -0.2878 -1.0990




