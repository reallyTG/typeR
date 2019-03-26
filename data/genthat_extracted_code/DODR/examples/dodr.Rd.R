library(DODR)


### Name: dodr
### Title: Detection of differences in rhythmic behavior between two time
###   series sets
### Aliases: dodr

### ** Examples

library(DODR)

#defining the parameters for two sets of oscillations
n=50
testTimes1 <- 0:15*3
testTimes2 <- testTimes1
tp <- length(testTimes1)
per1 <- 24
amp1 <- 0.3
ph1 <- 5
sd1 <- 0.1

per2 <- per1
amp2 <- amp1
ph2 <- ph1+4
sd2 <- sd1

#creating artificial oscillation sets
v1 <- 1 + amp1 * cos((testTimes1 - ph1)/per1*2*pi)
noise1 <- rnorm(length(testTimes1)*n, 0, sd1)
val1 <- matrix(v1 + noise1, ncol=n)

v2 <- 1 + amp2 * cos((testTimes2 - ph2)/per2*2*pi)
noise2 <- rnorm(length(testTimes2)*n, 0, sd2)
val2 <- matrix(v2 + noise2, ncol=n)

# run DODR
dodr <- dodr(val1, val2, testTimes1, testTimes2, 24, method = 'all')
dodr$p.value.table[1:3,]

#create another set with alterations in noise scale
ph2 <- ph1
sd2 <- sd1 * 3

v2 <- 1 + amp2 * cos((testTimes2 - ph2)/per2*2*pi)
noise2 <- rnorm(length(testTimes2)*n, 0, sd2)
val2 <- matrix(v2 + noise2, ncol=n)

dodr <- dodr(val1, val2, testTimes1, testTimes2, 24, method = 'all')
dodr$p.value.table[1:3,]




