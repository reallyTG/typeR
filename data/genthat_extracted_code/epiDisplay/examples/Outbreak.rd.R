library(epiDisplay)


### Name: Outbreak investigation
### Title: Dataset from an outbreak of food poisoning on a sportsday,
###   Thailand 1990.
### Aliases: Outbreak
### Keywords: datasets

### ** Examples

data(Outbreak)
.data <- Outbreak
# Distribution of reported pieces of eclair taken
attach(.data)
tab1(eclair) 

# Defining missing value
.data$eclair[.data$eclair > 20] <- NA
detach(.data)
attach(.data)
pieces.of.eclair <- cut(eclair, c(0,1,2,20), include.lowest=TRUE, right=FALSE)
tabpct(pieces.of.eclair, diarrhea)
rm(list=ls())
detach(.data) 



