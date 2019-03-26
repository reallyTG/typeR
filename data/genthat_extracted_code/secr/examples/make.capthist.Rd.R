library(secr)


### Name: make.capthist
### Title: Construct capthist Object
### Aliases: make.capthist
### Keywords: manip

### ** Examples


## peek at demonstration data
head(captXY)
head(trapXY)

demotraps <- read.traps(data = trapXY)
demoCHxy  <- make.capthist (captXY, demotraps, fmt = "XY")

demoCHxy            ## print method for capthist
plot(demoCHxy)      ## plot method for capthist
summary(demoCHxy)   ## summary method for capthist


## To enter `count' data without manually repeating rows
## need a frequency vector f, length(f) == nrow(captXY)
n <- nrow(captXY)
f <- sample (1:5, size = n, prob = rep(0.2,5), replace = TRUE)
## repeat rows as required...
captXY <- captXY[rep(1:n, f),]
counttraps <- read.traps(data = trapXY, detector = "count")
countCH  <- make.capthist (captXY, counttraps, fmt = "XY")




