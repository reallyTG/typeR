library(AER)


### Name: CollegeDistance
### Title: College Distance Data
### Aliases: CollegeDistance
### Keywords: datasets

### ** Examples

## exclude students from Western states
data("CollegeDistance")
cd <- subset(CollegeDistance, region != "west")
summary(cd)



