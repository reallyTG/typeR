library(Sleuth2)


### Name: case0301
### Title: Cloud Seeding
### Aliases: case0301
### Keywords: datasets

### ** Examples

str(case0301)
boxplot(Rainfall ~ Treatment, case0301)
boxplot(log(Rainfall) ~ Treatment, case0301)
library(lattice)
bwplot(Treatment ~ log(Rainfall), case0301)
bwplot(log(Rainfall) ~ Treatment, case0301)



