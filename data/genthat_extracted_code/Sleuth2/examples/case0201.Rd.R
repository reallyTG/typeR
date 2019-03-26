library(Sleuth2)


### Name: case0201
### Title: Bumpus's Data on Natural Selection (Humerus)
### Aliases: case0201
### Keywords: datasets

### ** Examples

str(case0201)
with(subset(case0201, Status=="Perished"), stem(Humerus, scale=10))
with(subset(case0201, Status=="Survived"), stem(Humerus))



