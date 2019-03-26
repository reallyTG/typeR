library(ppsbm)


### Name: sortIntensities
### Title: Sort intensities
### Aliases: sortIntensities

### ** Examples


z <- matrix(c(1,1,0,0,0,0, 0,0,1,1,0,0, 0,0,0,0,1,1), nrow = 3, byrow = TRUE)
hat.z <- matrix(c(0,0,1,1,0,0, 1,1,0,0,0,0, 0,0,0,0,1,1), nrow = 3, byrow = TRUE)

intens <- matrix(c(1,1,1,2,2,2,3,3,3),9)

sortIntensities(intens,z,hat.z, TRUE)




