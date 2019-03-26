library(SenSrivastava)


### Name: E1.20
### Title: Data on Physical Quality of Life Index (PQLI) Scores and Infant
###   Mortality Rates (IMR) for Selected Indian States
### Aliases: E1.20
### Keywords: datasets

### ** Examples

data(E1.20)
## Some data reorganization before analysis:
## Maybe reshape could have been used here?
 e1.20 <- data.frame(rbind(as.matrix(E1.20[,c(2,4)]), 
                          as.matrix(E1.20[,c(2,5)]),
                          as.matrix(E1.20[,c(2,6)]),
                          as.matrix(E1.20[,c(2,7)])),row.names=1:52)
  attr(e1.20,"names")[[2]] <- "IMR"
 e1.20$Female <- c(rep(0,13), rep(1,13),rep(0,13),rep(1,13))
 e1.20$Urban  <- c(rep(0,26),rep(1,26))
## Now the analysis can start.
summary(e1.20)



