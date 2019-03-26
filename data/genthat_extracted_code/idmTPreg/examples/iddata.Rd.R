library(idmTPreg)


### Name: iddata
### Title: Transforming a Simple Illness-Death Dataset into a Proper Data
###   Frame to be Used Inside 'TPreg' Function
### Aliases: iddata

### ** Examples

Stime <- c(10, 20, 34, 12, 30)
Sind <- c(1, 0, 0, 1, 1)
Iltime <- c(7, 20, 28, 12, 30)
Ilind <- c(1, 0, 1, 0, 0)
covar <- c(20, 25, 57, 36, 46)
mydata <- iddata(Stime, Sind, Iltime, Ilind, covar)  
mydata



