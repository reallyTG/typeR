library(pom)


### Name: weta.data
### Title: Occupancy data for the New Zealand Mahoenui Giant Weta
### Aliases: weta.data
### Keywords: datasets

### ** Examples

data(weta.data) 

fit1 <- siteocc(~weta.data$siteCovar$Browsed, ~weta.data$Obs1 + weta.data$Obs2, 
         histories=weta.data$detection.histories)
print(fit1)



