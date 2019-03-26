library(pedigree)


### Name: trimPed
### Title: Function to trim a pedigree based on available data
### Aliases: trimPed
### Keywords: utilities

### ** Examples

id <- 1:5
dam <- c(0,0,1,1,4)
sire <- c(0,0,2,2,3)
data <- c(FALSE,FALSE,TRUE,FALSE,FALSE)
ped <- data.frame(id,dam,sire)
yn <- trimPed(ped,data)
ped <- ped[yn,]



