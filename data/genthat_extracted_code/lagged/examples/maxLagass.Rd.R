library(lagged)


### Name: maxLag<-
### Title: Change the maximal lag in a lagged object
### Aliases: maxLag<--methods maxLag<- maxLag<-,Lagged-method
### Keywords: methods ts

### ** Examples

la1 <- Lagged(drop(acf(ldeaths)$acf))
la3 <- la1
la3
## shrink la3
maxLag(la3) # 18
maxLag(la3) <- 5
la3
maxLag(la3) # 5

## extend la3, new entries are filled with NA's
maxLag(la3) <- 10
la3



