library(qtlc)


### Name: areadens2D
### Title: Area vs. x-axis
### Aliases: areadens2D

### ** Examples


# A test example
fname01 <- system.file("extdata", "test025to100sp.tiff", package="qtlc")
testTLC <- createTLC(fname01, RGB=FALSE)
print(testTLC)

# now we'll imitate interactive spot2D function,
# and create spots coordinates automatically,
# for interactive version run testTLC <- spot2D(testTLC)
testTLC$spots$x <- c(40.93354, 83.18687, 121.59899, 160.01111, 203.54485,
                     239.39616, 280.36909, 320.06161, 362.31494, 399.44666,
                     439.13919, 480.11211, 518.52423, 559.49716, 599.18969)
testTLC$spots$y <- c(198.3160, 198.3160, 199.2833, 198.3160, 198.3160,
                     198.3160, 198.3160, 198.3160, 197.3487, 198.3160,
                     199.2833, 198.3160, 199.2833, 199.2833, 199.2833)

testTLC <- select2D(testTLC, 30, 30)
testTLC <- matrices2D(testTLC)
testTLC <- summat2D(testTLC)

# and now test the areadens2D for each spot
par(mfrow=c(3,3))
for(i in 1:15) {
areadens2D(testTLC, spot=i, ptype="l")
}




