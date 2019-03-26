library(MedDietCalc)


### Name: periodicity
### Title: Transforms data codified as daily, weekly or monthly, to any
###   other of them.
### Aliases: periodicity

### ** Examples

foodA <- c(1,2,3)
foodB <- c(3,2,1)
L <- list(foodA = foodA, foodB= foodB)

# Use with a numeric variable
periodicity(foodA, "daily", "weekly")

#Use with a list
periodicity(L, "daily", "weekly")



