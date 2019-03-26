library(riverdist)


### Name: upstreammat
### Title: Upstream Distance Matrix
### Aliases: upstreammat

### ** Examples

data(Gulk, fakefish)

# Mouth must be specified
Gulk$mouth$mouth.seg <- 1
Gulk$mouth$mouth.vert <- 1

logi1 <- (fakefish$flight.date==as.Date("2015-11-25"))

upstreammat(seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk, logical=logi1)



