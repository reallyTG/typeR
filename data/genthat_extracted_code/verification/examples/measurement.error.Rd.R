library(verification)


### Name: measurement.error
### Title: Skill score with measurement error.
### Aliases: measurement.error
### Keywords: file

### ** Examples

DAT<- data.frame( obs = round(runif(50)), frcs = runif(50))

A<-   measurement.error(DAT$obs, DAT$frcs, CI = TRUE)
A
### Finley Data

measurement.error(c(28, 23, 72, 2680)) ## assuming perfect observation,
                                       
     


