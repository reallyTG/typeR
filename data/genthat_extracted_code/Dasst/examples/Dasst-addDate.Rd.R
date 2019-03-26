library(Dasst)


### Name: addDate<-
### Title: Add date class to objects of class Dasst
### Aliases: addDate<- addDate<-,Dasst-method

### ** Examples

data(plantGrowth)
addDate(plantGrowth) <- ~ YEAR + DOY

# or
addDate(plantGrowth) <- c("YEAR", "DOY")

# or
addDate(plantGrowth) <- c(1, 2)

# Only one tables 1 and specifying date format
addDate(plantGrowth, index=c(1,2), format="%Y%j") <- ~ YEAR + DOY



