library(longitudinal)


### Name: longitudinal
### Title: Data Structure for Longitudinal Data
### Aliases: longitudinal as.longitudinal is.longitudinal
###   summary.longitudinal print.longitudinal plot.longitudinal
### Keywords: ts

### ** Examples

# load "longitudinal" library
library("longitudinal")

# load data set
data(tcell)
is.longitudinal(tcell.34)
attributes(tcell.34)
tcell.34[,1:3]

# how many samples and how many genes?
dim(tcell.34)
summary(tcell.34)

# plot first nine time series
plot(tcell.34, 1:9)

#####

# an artificial example with repeated measurements, irregular sampling, and unequal spacing 
m <- matrix(rnorm(200), 50, 4)
z <- as.longitudinal(m, repeats=c(10,5,5,10,20), time=c(2,8,9,15,16))
plot(z, 1:4)



