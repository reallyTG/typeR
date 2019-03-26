library(scan)


### Name: makesingleSC
### Title: Aggregate multiple single-cases into one case
### Aliases: makesingleSC
### Keywords: manip

### ** Examples

## Aggregate three random single-case data sets into one
study1 <- rSC(3, d.level = 0.8, d.slope = 0.1, round = 0)
new.sc <- makesingleSC(study1)
plotSC(new.sc, type = "p", lines = "trend")



