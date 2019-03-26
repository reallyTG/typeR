library(Bolstad)


### Name: sscsample
### Title: Simple, Stratified and Cluster Sampling
### Aliases: sscsample
### Keywords: misc

### ** Examples


## Draw 200 samples of size 20 using simple random sampling
sscsample(20,200)

## Draw 200 samples of size 20 using simple random sampling and store the
## results. Extract the means of all 200 samples, and the 50th sample
res = sscsample(20,200)
res$means
res$samples[,50]




