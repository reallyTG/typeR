library(icarus)


### Name: calibration
### Title: Calibration on margins
### Aliases: calibration

### ** Examples

N <- 300 ## population total
## Horvitz Thompson estimator of the mean: 1.666667
weightedMean(data_ex2$cinema, data_ex2$poids, N) 
## Enter calibration margins:
mar1 <- c("categ",3,80,90,60)
mar2 <- c("sexe",2,140,90,0)
mar3 <- c("service",2,100,130,0)
mar4 <- c("salaire", 0, 470000,0,0)
margins <- rbind(mar1, mar2, mar3, mar4)
## Compute calibrated weights with raking ratio method
wCal <- calibration(data=data_ex2, marginMatrix=margins, colWeights="poids"
                            , method="raking", description=FALSE)
## Calibrated estimate: 2.471917
weightedMean(data_ex2$cinema, wCal, N)




