library(SSBtools)


### Name: Stack
### Title: Stack columns from a data frame and include variables.
### Aliases: Stack

### ** Examples


 z <- data.frame(n=c(10,20,30), ssb=c('S','S','B'),
 Ayes=1:3,Ano=4:6,Byes=7:9,Bno=10:12)
 zRow <- data.frame(letter=c('A','A','B','B'),answer=c('yes','no','yes','no') )
 
 x <- Stack(z,3:6,1:2,zRow)
 
 Unstack(x,6,3:4,numeric(0),1:2)
 Unstack(x,6,5,numeric(0),1:2)
 Unstack(x,6,3:4,5,1:2)



