library(samplesizelogisticcasecontrol)


### Name: sampleSize_data
### Title: Sample size using pilot data
### Aliases: sampleSize_data

### ** Examples

  prev  <- 0.01
  logOR <- 0.3
  data  <- matrix(rnorm(100, mean=1.5), ncol=1)

  # Assuming exposuure is N(1.5, 1)
  sampleSize_data(prev, logOR, data) 




