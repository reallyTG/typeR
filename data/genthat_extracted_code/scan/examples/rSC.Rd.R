library(scan)


### Name: rSC
### Title: Single-case data generator
### Aliases: rSC
### Keywords: datagen

### ** Examples

## Create random single-case data and inspect it
dat <- rSC(n = 3, rtt = 0.75, round = 1, d.slope = 0.1, extreme.p = 0.1,
       missing.p = 0.1, random.names = TRUE)
describeSC(dat)
plotSC(dat)

## And now have a look at poisson-distributed data
dat <- rSC(n = 3, B.start = c(6,10,14), MT = c(12,20,22), m = 10,
       distribution = "poisson", d.level = -5, missing.p = 0.1)
pand(dat, correction = FALSE)



