library(seacarb)


### Name: at
### Title: Calculates total alkalinity from potentiometric titration data
### Aliases: at
### Keywords: utilities

### ** Examples

data(alkalinity)
data <- alkalinity
AT <- at(S=data$S[1], T=data$temperature, C=data$normality[1], pHTris=data$pHTris[1],
      ETris=data$ETris[1], E=data$E, weight=data$weight[1], volume=data$volume)



