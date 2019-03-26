library(IsoplotR)


### Name: concordia
### Title: Concordia diagram
### Aliases: concordia

### ** Examples

data(examples)
concordia(examples$UPb,show.age=2)

dev.new()
concordia(examples$UPb,wetherill=FALSE,
          xlim=c(24.9,25.4),ylim=c(0.0508,0.0518),
          ticks=249:254,exterr=TRUE)

dev.new()
concordia(examples$UPb,wetherill=FALSE,show.age=2,anchor=list(TRUE,0))




