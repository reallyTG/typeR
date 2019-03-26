library(secr)


### Name: summary.capthist
### Title: Summarise Detections
### Aliases: summary.capthist print.summary.capthist counts
### Keywords: models

### ** Examples

temptrap <- make.grid(nx = 5, ny = 3)
summary(sim.capthist(temptrap))
summary(sim.capthist(temptrap))$counts["n",]



