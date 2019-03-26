library(CountsEPPM)


### Name: LRTruncation
### Title: Probabilities for distributions truncated on the left (lower)
###   and/or right (upper).
### Aliases: LRTruncation
### Keywords: misc

### ** Examples

probability <- c(3.375659e-08, 1.023277e-05, 5.440752e-04,
 8.768246e-03, 5.663573e-02, 1.735599e-01, 2.819850e-01,
 2.625282e-01, 1.482712e-01, 5.305443e-02, 1.244452e-02)
probabilities <- LRTruncation(probability, ltvalue=4, utvalue=11)
print(probabilities)



