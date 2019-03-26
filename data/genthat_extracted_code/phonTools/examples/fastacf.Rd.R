library(phonTools)


### Name: fastacf
### Title: Fast Autocorrelation
### Aliases: fastacf

### ** Examples


## Uncomment and run the code below to see the speed advantage.
## Raising the n makes the difference even more pronounced.
#n = 25000
#system.time ({
#acf (rnorm (n), plot = F, lag.max = n)
#})

#system.time ({
#fastacf (rnorm (n), plot = F, lag.max = n)
#})




