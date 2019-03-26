library(PracTools)


### Name: BW3stagePPS
### Title: Relvariance components for 3-stage sample
### Aliases: BW3stagePPS
### Keywords: methods survey

### ** Examples

data(MDarea.pop)
MDsub <- MDarea.pop[1:100000,]
M <- length(unique(MDsub$PSU))
    # srs/srs/srs design
pp.PSU <- rep(1/M,M)
BW3stagePPS(X=MDsub$y1, pp=pp.PSU, psuID=MDsub$PSU, ssuID=MDsub$SSU)
    # ppswr/srs/srs design
pp.PSU <- table(MDsub$PSU) / nrow(MDsub)
BW3stagePPS(X=MDsub$y1, pp=pp.PSU, psuID=MDsub$PSU, ssuID=MDsub$SSU)



