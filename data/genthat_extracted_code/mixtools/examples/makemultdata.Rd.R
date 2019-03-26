library(mixtools)


### Name: makemultdata
### Title: Produce Cutpoint Multinomial Data
### Aliases: makemultdata
### Keywords: file

### ** Examples

## Randomly generated data.

set.seed(100)
y <- matrix(rpois(70, 6), 10, 7)
cuts <- c(2, 5, 7)
out1 <- makemultdata(y, cuts = cuts)
out1

## The sulfur content of the coal seams in Texas.

A <- c(1.51, 1.92, 1.08, 2.04, 2.14, 1.76, 1.17)
B <- c(1.69, 0.64, .9, 1.41, 1.01, .84, 1.28, 1.59)
C <- c(1.56, 1.22, 1.32, 1.39, 1.33, 1.54, 1.04, 2.25, 1.49)
D <- c(1.3, .75, 1.26, .69, .62, .9, 1.2, .32)
E <- c(.73, .8, .9, 1.24, .82, .72, .57, 1.18, .54, 1.3)

out2 <- makemultdata(A, B, C, D, E, 
                     cuts = median(c(A, B, C, D, E)))
out2

## The reaction time data.

data(RTdata)
out3 <- makemultdata(RTdata, cuts = 
                     100*c(5, 10, 12, 14, 16, 20, 25, 30, 40, 50))
dim(out3$y)
out3$y[1:10,]



