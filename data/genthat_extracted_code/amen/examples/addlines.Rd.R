library(amen)


### Name: addlines
### Title: Add lines
### Aliases: addlines

### ** Examples


data(addhealthc3) 
Y<-addhealthc3$Y
X<-xnet(Y) 
netplot(Y,X) 
addlines(Y,X,col=Y[Y!=0]) 




