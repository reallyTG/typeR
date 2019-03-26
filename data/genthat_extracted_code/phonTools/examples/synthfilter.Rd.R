library(phonTools)


### Name: synthfilter
### Title: Filtering by Synthesis
### Aliases: synthfilter

### ** Examples


## uncomment and run
##  white noise
noise = rnorm(5000)

## low-pass filter
#synthfilter (noise, band = c(0, .25), verify = TRUE)

##  band-pass filter
synthfilter (noise, band = c(.15, .25), verify = TRUE)

##  high-pass filter
#synthfilter (noise, band = c(.35, .5), verify = TRUE)




