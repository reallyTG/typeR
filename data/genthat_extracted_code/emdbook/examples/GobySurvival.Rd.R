library(emdbook)


### Name: GobySurvival
### Title: Goby (reef fish) survivorship data
### Aliases: GobySurvival
### Keywords: datasets

### ** Examples

## midpoint of survival times
gg <- transform(GobySurvival,mid=(d1+d2)/2)
plot(table(gg$mid))



