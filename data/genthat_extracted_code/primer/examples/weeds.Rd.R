library(primer)


### Name: weeds
### Title: Percent cover of six perennial herbaceous plants
### Aliases: weeds
### Keywords: datasets

### ** Examples

data(weeds)
str(weeds); 
library(lattice)
xyplot(Cover ~ Age, data=weeds, groups=Species, type=c("a"),
auto.key=list(lines=TRUE, points=FALSE, columns=3),
ylim=c(-1,20))



